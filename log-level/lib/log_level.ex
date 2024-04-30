defmodule LogLevel do
  @log_default %{
    log_code: -1,
    log_label: :unknown,
    legacy: true
  }
  @log_table [
    %{
      log_code: 0,
      log_label: :trace,
      legacy: false
    },
    %{
      log_code: 1,
      log_label: :debug,
      legacy: true
    },
    %{
      log_code: 2,
      log_label: :info,
      legacy: true
    },
    %{
      log_code: 3,
      log_label: :warning,
      legacy: true
    },
    %{
      log_code: 4,
      log_label: :error,
      legacy: true
    },
    %{
      log_code: 5,
      log_label: :fatal,
      legacy: false
    }
  ]

  def to_label(level, legacy?) do
    log = Enum.find(@log_table, @log_default, fn l -> l[:log_code] == level end)

    cond do
      legacy? and log[:legacy] -> log[:log_label]
      not legacy? -> log[:log_label]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    log = to_label(level, legacy?)

    cond do
      log == :error or log == :fatal -> :ops
      log == :unknown and legacy? -> :dev1
      log == :unknown -> :dev2
      true -> false
    end
  end
end
