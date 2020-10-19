defmodule TaskManager.EctoEnums do
  import EctoEnum
  defenum StatusEnum, :status, [:incomplete, :complete, :locked]
end
