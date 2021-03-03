enum Behaviors {
  REGULAR,
  LOADING,
  ERROR,
  SUCCESS,
  INFO,
  WARNING,
  DISABLED,
  ACTIVE,
  INACTIVE,
}

mixin BehaviorsEnum {
  Behaviors get bRegular => Behaviors.REGULAR;
  get bLoading => Behaviors.LOADING;
  get bError => Behaviors.ERROR;
  get bSuccess => Behaviors.SUCCESS;
  get bInfo => Behaviors.INFO;
  get bDisabled => Behaviors.DISABLED;
  get bActive => Behaviors.ACTIVE;
  get bInactive => Behaviors.INACTIVE;
}
