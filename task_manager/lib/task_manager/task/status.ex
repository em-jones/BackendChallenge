defmodule TaskManager.Task.Status do
  import EctoEnum
  defenum Status, complete: 0, locked: 1, incomplete: 2
end
