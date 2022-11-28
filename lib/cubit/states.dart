abstract class NewsStates{}
class InitialState extends NewsStates{}
class BottomNavState extends NewsStates{}
class GetNewsBusinessSuccess extends NewsStates{}
class GetNewsBusinessError extends NewsStates{
   String error;
   GetNewsBusinessError(this.error);
}
class GetNewsBusinessLoading extends NewsStates{}

class GetNewsSportsSuccess extends NewsStates{}
class GetNewsSportsError extends NewsStates{
   String error;
   GetNewsSportsError(this.error);
}
class GetNewsSportsLoading extends NewsStates{}

class GetNewsScienceSuccess extends NewsStates{}
class GetNewsScienceError extends NewsStates{
   String error;
   GetNewsScienceError(this.error);
}
class GetNewsScienceLoading extends NewsStates{}

class GetNewsSearchSuccess extends NewsStates{}
class GetNewsSearchError extends NewsStates{
   String error;
   GetNewsSearchError(this.error);
}
class GetNewsSearchLoading extends NewsStates{}

class GetThemeChangedState extends NewsStates{}