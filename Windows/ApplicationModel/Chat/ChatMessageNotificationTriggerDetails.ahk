#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatMessageNotificationTriggerDetails.ahk
#Include .\IChatMessageNotificationTriggerDetails2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the message notification triggered from a registered background task. A chat app can receive notifications of incoming messages or send events by setting a task trigger and task entry point.
 * @remarks
 * A chat app must register a background task to process notifications in order to serve as the default handler for incoming messages. In order to register a background task, the *Package.appxmanifest* file must contain a background task extension. Add the following code snippet into the `Application/Extensions` element.
 * 
 * ```xml
 * <Extension Category="windows.backgroundTasks" Entry-Point="Tasks.ExampleBackgroundTask">
 *     <BackgroundTasks>
 *         <Task Type="chatMessageNotification"/>
 *         <Task Type="systemEvent"/>
 *     </BackgroundTasks>
 * </Extension>
 * 
 * ```
 * 
 * The background task's [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method receives a task instance with the notification trigger details. The [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property is cast to a ChatMessageNotificationTriggerDetails object. The trigger details for a chat message are obtained as shown in the following example.
 * 
 * ```
 * public void Run(IBackgroundTaskInstance taskInstance)
 * {
 *     BackgroundTaskDeferral deferral = taskInstance.GetDeferral();
 *     ChatMessageNotificationTriggerDetails triggerDetails =
 *         (ChatMessageNotificationTriggerDetails) taskInstance.TriggerDetails;
 *     
 *     if (triggerDetails != null)
 *     {
 *         SendToast(triggerDetails.ChatMessage);
 *     }
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatMessageNotificationTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatMessageNotificationTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatMessageNotificationTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the message associated with the notification. This is either an incoming message or an outgoing message with a send status event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails.chatmessage
     * @type {ChatMessage} 
     */
    ChatMessage {
        get => this.get_ChatMessage()
    }

    /**
     * Gets a Boolean value indicating if the background task should issue a toast notification for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails.shoulddisplaytoast
     * @type {Boolean} 
     */
    ShouldDisplayToast {
        get => this.get_ShouldDisplayToast()
    }

    /**
     * Gets a Boolean value indicating that the background task should update the app's tile count for the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails.shouldupdatedetailtext
     * @type {Boolean} 
     */
    ShouldUpdateDetailText {
        get => this.get_ShouldUpdateDetailText()
    }

    /**
     * Gets a Boolean value indicating if the background task should update the app’s lock screen count.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails.shouldupdatebadge
     * @type {Boolean} 
     */
    ShouldUpdateBadge {
        get => this.get_ShouldUpdateBadge()
    }

    /**
     * Gets a Boolean value indicating if the Windows Action Center should be updated with the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatmessagenotificationtriggerdetails.shouldupdateactioncenter
     * @type {Boolean} 
     */
    ShouldUpdateActionCenter {
        get => this.get_ShouldUpdateActionCenter()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ChatMessage} 
     */
    get_ChatMessage() {
        if (!this.HasProp("__IChatMessageNotificationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IChatMessageNotificationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageNotificationTriggerDetails := IChatMessageNotificationTriggerDetails(outPtr)
        }

        return this.__IChatMessageNotificationTriggerDetails.get_ChatMessage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldDisplayToast() {
        if (!this.HasProp("__IChatMessageNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IChatMessageNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageNotificationTriggerDetails2 := IChatMessageNotificationTriggerDetails2(outPtr)
        }

        return this.__IChatMessageNotificationTriggerDetails2.get_ShouldDisplayToast()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateDetailText() {
        if (!this.HasProp("__IChatMessageNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IChatMessageNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageNotificationTriggerDetails2 := IChatMessageNotificationTriggerDetails2(outPtr)
        }

        return this.__IChatMessageNotificationTriggerDetails2.get_ShouldUpdateDetailText()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateBadge() {
        if (!this.HasProp("__IChatMessageNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IChatMessageNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageNotificationTriggerDetails2 := IChatMessageNotificationTriggerDetails2(outPtr)
        }

        return this.__IChatMessageNotificationTriggerDetails2.get_ShouldUpdateBadge()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldUpdateActionCenter() {
        if (!this.HasProp("__IChatMessageNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IChatMessageNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatMessageNotificationTriggerDetails2 := IChatMessageNotificationTriggerDetails2(outPtr)
        }

        return this.__IChatMessageNotificationTriggerDetails2.get_ShouldUpdateActionCenter()
    }

;@endregion Instance Methods
}
