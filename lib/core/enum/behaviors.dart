enum Behaviours {
  REGULAR,
  LAODING,
  ERROR,
  SUCCESS,
  INFO,
  WARNING,
  DISABLED,
}

mixin BehavioursEnum {
  Behaviours get bRegular => Behaviours.REGULAR;
  get bLoading => Behaviours.LAODING;
  get bError => Behaviours.ERROR;
  get bSuccess => Behaviours.SUCCESS;
  get bInfo => Behaviours.INFO;
  get bDisabled => Behaviours.DISABLED;
}
