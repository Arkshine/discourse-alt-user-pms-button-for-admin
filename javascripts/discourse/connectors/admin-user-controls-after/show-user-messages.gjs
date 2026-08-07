import Component from "@glimmer/component";
import { LinkTo } from "@ember/routing";
import { service } from "@ember/service";
import dIcon from "discourse/ui-kit/helpers/d-icon";
import { i18n } from "discourse-i18n";

export default class ShowUserMessages extends Component {
  @service currentUser;

  <template>
    {{#if this.currentUser.admin}}
      <LinkTo
        @route="userPrivateMessages"
        @model={{@outletArgs.model}}
        class="btn btn-default show-messages"
      >
        {{dIcon "envelope"}}
        {{i18n (themePrefix "admin.user.show_messages")}}
      </LinkTo>
    {{/if}}
  </template>
}
