import { computed } from "@ember/object";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  /**
   * Hides the "messages" tab for admin when visiting a user's profile.
   */
  api.modifyClass("controller:user", (Superclass) => {
    return class extends Superclass {
      @computed(
        "viewingSelf",
        "currentUser.admin",
        "currentUser.can_send_private_messages"
      )
      get showPrivateMessages() {
        return (
          this.currentUser?.can_send_private_messages &&
          this.viewingSelf /*|| this.currentUser?.admin*/
        );
      }
    };
  });
});
