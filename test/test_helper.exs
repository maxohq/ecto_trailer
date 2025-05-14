TestRepo.start_link()
Application.put_env(:ex_unit, :capture_log, true)
ExUnit.start(timeout: :infinity)
Ecto.Adapters.SQL.Sandbox.mode(TestRepo, :manual)
