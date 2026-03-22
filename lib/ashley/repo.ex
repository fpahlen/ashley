defmodule Ashley.Repo do
  use AshPostgres.Repo, otp_app: :ashley

  def installed_extensions do
    ["ash-functions", "uuid-ossp"]
  end

  # Silences the warning you saw
  def min_pg_version do
    %Version{major: 14, minor: 0, patch: 0}
  end
end
