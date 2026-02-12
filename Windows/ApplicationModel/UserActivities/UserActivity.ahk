#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivity.ahk
#Include .\IUserActivity2.ahk
#Include .\IUserActivity3.ahk
#Include .\IUserActivityFactory.ahk
#Include .\IUserActivityStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A **UserActivity** is created by an app during its execution to notify the system of a user work stream that can be continued on another device, or at another time on the same device. It provides information about a task the user is engaged in.
  * 
  * > [!NOTE]
  * > Starting in July 2021, users who have activity history synced across their Windows devices
  * > through their Microsoft Account (MSA) will no longer have the option to upload new activity
  * > in Timeline. They'll still be able to use Timeline and see their activity history (information
  * > about recent apps, websites and files) on their local PC. AAD-connected accounts won't be 
  * > impacted.
 * @remarks
 * > [!NOTE]
 * > Starting in July 2021, users who have activity history synced across their Windows devices
 * > through their Microsoft Account (MSA) will no longer have the option to upload new activity
 * > in Timeline. They'll still be able to use Timeline and see their activity history (information
 * > about recent apps, websites and files) on their local PC. AAD-connected accounts won't be 
 * > impacted. 
 * 
 * A **UserActivity** encapsulates a user's task that can be continued at a later time, and potentially on a different device. Creating a **User Activity** causes that activity to be capable of appearing in Windows Timeline and in Cortana's Pick up where I left off feature. Timeline is a rich task view that shows a chronological view of what you’ve been working on, via activities that Windows believes to have had significant user engagement. It can also include what you were working on across devices. For example, a mail app could create a **UserActivity** when the user starts creating a new email message. The user could pause working on the email and then work on it later on the same machine, or even another device.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivity.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a UserActivity with a specified activity ID
     * @param {HSTRING} activityId The ID for this activity.
     * @returns {UserActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.#ctor
     */
    static CreateWithActivityId(activityId) {
        if (!UserActivity.HasProp("__IUserActivityFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityFactory.IID)
            UserActivity.__IUserActivityFactory := IUserActivityFactory(factoryPtr)
        }

        return UserActivity.__IUserActivityFactory.CreateWithActivityId(activityId)
    }

    /**
     * Constructs a [UserActivity](useractivity.md) from a JSON string.
     * @remarks
     * The **UserActivity** APIs allow an application to provide rich information for Cortana Pick-up Where I Left Off and the Timeline. A better re-engagement UI can be built within the consuming  application if the source application can provide more details about the re-engagement. This method creates a **UserActivity** from information stored in a JSON string that a source application provided so that the consuming application can get information about the source application, and the specific activity within the source application.
     * @param {HSTRING} json The JSON string that represents the **UserActivity**.
     * @returns {UserActivity} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.tryparsefromjson
     */
    static TryParseFromJson(json) {
        if (!UserActivity.HasProp("__IUserActivityStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityStatics.IID)
            UserActivity.__IUserActivityStatics := IUserActivityStatics(factoryPtr)
        }

        return UserActivity.__IUserActivityStatics.TryParseFromJson(json)
    }

    /**
     * Creates a collection of [UserActivity](useractivity.md) objects from a JSON string.
     * @remarks
     * The **UserActivity** APIs allow an application to provide rich information for Cortana Pick-up Where I Left Off and the Timeline. A better re-engagement UI can be built within the consuming  application if the source application can provide more details about the re-engagement. This method creates a collection of **UserActivity** objects from information stored in a JSON string that a source application provided so that the consuming application can get information about the source application, and the specific activities within the source application.
     * @param {HSTRING} json The JSON string that represents a collection of **UserActivity** objects.
     * @returns {IVector<UserActivity>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.tryparsefromjsonarray
     */
    static TryParseFromJsonArray(json) {
        if (!UserActivity.HasProp("__IUserActivityStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityStatics.IID)
            UserActivity.__IUserActivityStatics := IUserActivityStatics(factoryPtr)
        }

        return UserActivity.__IUserActivityStatics.TryParseFromJsonArray(json)
    }

    /**
     * Serializes a collection of [UserActivity](useractivity.md) objects into a JSON string. Among other things, the JSON string will contain the App display name, the activation URL, the content URL, content information, and visual element information such as description, background color, and so on for each **UserActivity**.
     * @remarks
     * A better re-engagement UI can be built within a consuming application if the source application can provide more details about the re-engagement. By serializing the collection of **UserActivity** objects into a JSON string, you can then store them in a  [DataPackage](/uwp/api/windows.applicationmodel.datatransfer.datapackage) and reconstitute them in the consuming application to provide more insight about the source application and the specific activities within the application that sourced the **DataPackage**.
     * @param {IIterable<UserActivity>} activities The collection of user activities to convert to JSON.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.tojsonarray
     */
    static ToJsonArray(activities) {
        if (!UserActivity.HasProp("__IUserActivityStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivity")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityStatics.IID)
            UserActivity.__IUserActivityStatics := IUserActivityStatics(factoryPtr)
        }

        return UserActivity.__IUserActivityStatics.ToJsonArray(activities)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state (**Published** or **New**) of this **UserActivity**.
     * @remarks
     * Knowing that a **UserActivity** is **New** versus **Published** can be used to determine whether [GetOrCreateUserActivityAsync()](useractivitychannel_getorcreateuseractivityasync_1939478900.md) returned a newly created **UserActivity** or one that had been previously created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the activity ID that was assigned to this **UserActivity** when it was created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.activityid
     * @type {HSTRING} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * Gets information that can be used for the details tile for this activity.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.visualelements
     * @type {UserActivityVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * Gets and sets the content Uniform Resource Identifier (URI) of the content or document that is represented by the UserActivity.
     * @remarks
     * One use for a content URI is if you don't have a website for the app but you have content that could be viewed, instead.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.contenturi
     * @type {Uri} 
     */
    ContentUri {
        get => this.get_ContentUri()
        set => this.put_ContentUri(value)
    }

    /**
     * Gets and sets the MIME (Multipurpose Internet Mail Extensions) type of the content stored at [UserActivity.ContentUri](useractivity_contenturi.md).  For example, "text/plain".
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.contenttype
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * Gets and sets the fallback Uniform Resource Identifier (URI) to use if there is no handler for the activation URI.
     * @remarks
     * This should be a http or https URI that the system can fall back to if there is no handler for the activation URI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.fallbackuri
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * Gets and sets the activation Uniform Resource Identifier (URI).
     * @remarks
     * The activation URI provides a cross-platform activation context for the activity.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.activationuri
     * @type {Uri} 
     */
    ActivationUri {
        get => this.get_ActivationUri()
        set => this.put_ActivationUri(value)
    }

    /**
     * Gets or sets the content information object for this user activity.
     * @remarks
     * The content information inside the **UserActivityContentInfo** object is stored in the JSON format.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.contentinfo
     * @type {IUserActivityContentInfo} 
     */
    ContentInfo {
        get => this.get_ContentInfo()
        set => this.put_ContentInfo(value)
    }

    /**
     * Gets and sets whether the particular activity's metadata should be uploaded to the Microsoft Cloud.
     * @remarks
     * When this property is set to False, the activity and its associated metadata will not be uploaded. The activity can still be serialized to JSON, put on the clipboard, and otherwise made available to other applications. In that case, it is the responsibility of the application receiving the activity to determine whether or not to enforce this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.isroamable
     * @type {Boolean} 
     */
    IsRoamable {
        get => this.get_IsRoamable()
        set => this.put_IsRoamable(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_ActivityId()
    }

    /**
     * 
     * @returns {UserActivityVisualElements} 
     */
    get_VisualElements() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_VisualElements()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentUri() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_ContentUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentUri(value) {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.put_ContentUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_ContentType()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.put_ContentType(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_FallbackUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FallbackUri(value) {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.put_FallbackUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ActivationUri() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_ActivationUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ActivationUri(value) {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.put_ActivationUri(value)
    }

    /**
     * 
     * @returns {IUserActivityContentInfo} 
     */
    get_ContentInfo() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.get_ContentInfo()
    }

    /**
     * 
     * @param {IUserActivityContentInfo} value 
     * @returns {HRESULT} 
     */
    put_ContentInfo(value) {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.put_ContentInfo(value)
    }

    /**
     * Publish the [UserActivity](useractivity.md).
     * @remarks
     * **UserActivity.VisualElements.DisplayText** and **UserActivity.ActivationUri** must be set before calling **SaveAsync()** or the call will fail.
     * 
     * Saving a **UserActivity** converts its state to [UserActivityState.Published](useractivity_state.md)
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.SaveAsync()
    }

    /**
     * Creates a [UserActivitySession](useractivitysession.md) that this user activity will be associated with. You must call this method on the UI thread.
     * @remarks
     * When a [UserActivity](useractivity.md) is associated with a **UserActivitySession**, it indicates that the user is currently engaged in the activity.
     * @returns {UserActivitySession} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.createsession
     */
    CreateSession() {
        if (!this.HasProp("__IUserActivity")) {
            if ((queryResult := this.QueryInterface(IUserActivity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity := IUserActivity(outPtr)
        }

        return this.__IUserActivity.CreateSession()
    }

    /**
     * Serializes the [UserActivity](useractivity.md) into a JSON string. Among other things, the JSON string will contain the App display name, the activation URL, the content URL, content information, and visual element information such as description, background color, and so on.
     * @remarks
     * A better re-engagement UI can be built within a consuming application if the source application can provide more details about the re-engagement. By serializing the **UserActivity** into a JSON string, you can then store it in a  [DataPackage](/uwp/api/windows.applicationmodel.datatransfer.datapackage) and reconstitute it in the consuming application to provide more insight about the source application and the specific activity within the application that sourced the **DataPackage**.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivity.tojson
     */
    ToJson() {
        if (!this.HasProp("__IUserActivity2")) {
            if ((queryResult := this.QueryInterface(IUserActivity2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity2 := IUserActivity2(outPtr)
        }

        return this.__IUserActivity2.ToJson()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRoamable() {
        if (!this.HasProp("__IUserActivity3")) {
            if ((queryResult := this.QueryInterface(IUserActivity3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity3 := IUserActivity3(outPtr)
        }

        return this.__IUserActivity3.get_IsRoamable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRoamable(value) {
        if (!this.HasProp("__IUserActivity3")) {
            if ((queryResult := this.QueryInterface(IUserActivity3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivity3 := IUserActivity3(outPtr)
        }

        return this.__IUserActivity3.put_IsRoamable(value)
    }

;@endregion Instance Methods
}
