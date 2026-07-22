<!--================================================================================
  DopamineSystem.DES
  Integrated Dopamine Reward-Learning & Addiction model for HumMod
  UTSC Directed Research Project

  This module couples TWO classic theories of drug reward and addiction and
  drives them from blood-alcohol concentration (EthanolPool.[Ethanol]):

  (1) REWARD PREDICTION ERROR (RPE / temporal-difference learning)
      Schultz, Dayan & Montague (1997); Schultz (1998).
      delta (RPE) = ActualReward - RewardPrediction
        * unpredicted reward  -> positive RPE -> phasic dopamine BURST
        * fully predicted reward -> RPE ~ 0   -> NO dopamine response
        * predicted reward omitted -> negative RPE -> dopamine DIP
      The prediction is learned (updated toward the reward it experiences),
      so a repeatedly-experienced reward stops evoking a dopamine signal.

  (2) OPPONENT-PROCESS / HEDONIC HOMEOSTATIC DYSREGULATION
      Solomon & Corbit (1974); Koob & Le Moal (1997, 2001).
      ExperiencedState = AProcess - BProcess
        * A-process: fast-rising drug euphoria ("the high").
                     SHRINKS with repeated use  -> tolerance.
        * B-process: slow-rising, long-lasting withdrawal/craving.
                     GROWS with repeated use     -> dependence/sensitization.
      Net result after addiction: little/no high, large negative aftereffect
      ("agony, intense craving") = a downward-shifted hedonic set-point.

  COUPLING: Blood-alcohol concentration (BAC, g/dL) sets the moment-to-moment
  unconditioned reward magnitude through a biphasic dose-response curve
  (low/moderate BAC = euphoric/stimulant, high BAC = sedative; the classic
  biphasic alcohol response, e.g. Addicott et al. 2007). That reward drives
  both the RPE/dopamine system and the opponent A/B processes. The growing
  B-process also suppresses tonic dopamine, reproducing the dopamine
  hypofunction of the addicted/withdrawn state (Koob "within-system"
  neuroadaptation).

  TIME BASE: HumMod's independent variable (System.X) is in MINUTES, so all
  time constants below are in minutes.

  WIRING (add to the master Ethanol.DES, AFTER EthanolPool): 

      <?include DopamineSystem.DES ?>
      CalcConc block: <call> DopamineSystem.CalcConc </call>
      Dervs   block:  <call> DopamineSystem.Dervs   </call>
      Wrapup  block:  <call> DopamineSystem.Wrapup  </call> -->