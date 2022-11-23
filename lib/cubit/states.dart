abstract class NewsStates{}
class InitialState extends NewsStates{}
class BottomNavState extends NewsStates{}
class GetNewsBusinessSuccess extends NewsStates{}
class GetNewsBusinessError extends NewsStates{
   String error;
   GetNewsBusinessError(this.error);
}
class GetNewsBusinessLoading extends NewsStates{}