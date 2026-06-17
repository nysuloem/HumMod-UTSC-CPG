# Dopamine Reward-Learning & Addiction — HumMod Display Package

Display (UI) files for `DopamineSystem.DES`. They create the panels, graphs,
and parameter controls a student/researcher uses to explore dopamine dynamics
during ethanol-consumption scenarios.

## Files
| File | Role |
|------|------|
| `Dopamine.DES` | **Master** — declares the menu tree + slider lists (`<common>`) and `<?include?>`s the five panels. This is the only file you reference from the model. |
| `DopamineDynamics.DES` | Panel 1 — DopamineLevel, TonicDA, PhasicDA values + DA time-graph |
| `RewardLearning.DES` | Panel 2 — ActualReward, RewardPrediction, PredictionError values + RPE graph |
| `HedonicState.DES` | Panel 3 — AProcess, BProcess, ExperiencedState, set-point + opponent-process graph and long-run hedonic-shift graph |
| `Neuroadaptation.DES` | Panel 4 — exposure count, A/B gains + gains-over-time graph + "Reset Adaptation" button |
| `DopamineControls.DES` | Panel 5 — slidebars for learning rate, time constants, DA gains, tolerance/sensitization steps |

## Integration
1. Make sure `DopamineSystem.DES` is included in the model's **structure** list
   and its `CalcConc` / `Dervs` / `Wrapup` blocks are called (see that file's header).
2. Add **one line** to the model's top-level **display** include list (the file
   that holds the `<display>` root), next to the other display `<?include?>`s:

   ```xml
   <?include Display\Dopamine\Dopamine.DES ?>
   ```

3. Launch the model. A **"Dopamine & Reward"** menu appears with the five panels.

## Notes
- All display elements reference global names (`DopamineSystem.<var>`), so the
  package works wherever the structure file is loaded.
- Graph x-axis is `System.X` (minutes). Per-episode graphs default to a 720-min
  window; the long-run hedonic/neuroadaptation graphs use a 7-day (10080-min) window.
- The adjustable items are all `<parm>`s in `DopamineSystem.DES`, so slider
  changes take effect live during a run.
