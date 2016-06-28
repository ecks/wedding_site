import PageWelcomeView from './page/welcome';
import PageAbout_usView from './page/about_us';
import PageEvent_detailsView from './page/event_details';

// Collection of specific view modules
const views = {
   PageWelcomeView,
   PageAbout_usView,
   PageEvent_detailsView
   };

export default function loadView(viewName) {
    return views[viewName]
}
