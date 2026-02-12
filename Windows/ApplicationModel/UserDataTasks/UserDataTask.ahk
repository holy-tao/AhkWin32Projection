#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTask.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a task.
 * @remarks
 * No matter how you store task information in your app, you must be able to put that information into a UserDataTask object. This way, other apps that allow users to select tasks can use your app and process the task information it provides.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTask.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the unique identifier for the task list associated with the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.listid
     * @type {HSTRING} 
     */
    ListId {
        get => this.get_ListId()
    }

    /**
     * Gets or sets an ID that can be used by a service provider to access the [UserDataTask](userdatatask.md) in their remote system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the completion date and time of the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.completeddate
     * @type {IReference<DateTime>} 
     */
    CompletedDate {
        get => this.get_CompletedDate()
        set => this.put_CompletedDate(value)
    }

    /**
     * Gets or sets a string value. The string contains extended details that describe the task. Details is of type String and a maximum of 1,073,741,823 characters in length, which is the maximum length of a JET database string.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.details
     * @type {HSTRING} 
     */
    Details {
        get => this.get_Details()
        set => this.put_Details(value)
    }

    /**
     * Gets or sets the type of task details, plain text or HTML.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.detailskind
     * @type {Integer} 
     */
    DetailsKind {
        get => this.get_DetailsKind()
        set => this.put_DetailsKind(value)
    }

    /**
     * Gets or sets the due date of the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.duedate
     * @type {IReference<DateTime>} 
     */
    DueDate {
        get => this.get_DueDate()
        set => this.put_DueDate(value)
    }

    /**
     * Gets the kind of task (For example: Recurring etc.).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets or sets the priority of the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * Gets or sets an object that represents when and how often a task occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.recurrenceproperties
     * @type {UserDataTaskRecurrenceProperties} 
     */
    RecurrenceProperties {
        get => this.get_RecurrenceProperties()
        set => this.put_RecurrenceProperties(value)
    }

    /**
     * Gets or sets an object that represents how many times and at what interval the task is generated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.regenerationproperties
     * @type {UserDataTaskRegenerationProperties} 
     */
    RegenerationProperties {
        get => this.get_RegenerationProperties()
        set => this.put_RegenerationProperties(value)
    }

    /**
     * Gets or sets a time span value. The value declares the amount of time to subtract from the [DueDate](userdatatask_duedate.md), and that time used as the issue time for a reminder for a task. A **null** value indicates that the task won't issue a reminder. Reminder is of type [IReference(TimeSpan)](../windows.foundation/ireference_1.md).
     * @remarks
     * This property uses a time span value, which is represented differently depending on which language you are programming with. For more information about how to use a time span value, see the [Duration](../windows.applicationmodel.appointments/appointment_duration.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.reminder
     * @type {IReference<DateTime>} 
     */
    Reminder {
        get => this.get_Reminder()
        set => this.put_Reminder(value)
    }

    /**
     * Gets or sets a [UserDataTaskSensitivity](userdatatasksensitivity.md)-typed value that indicates the sensitivity of the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.sensitivity
     * @type {Integer} 
     */
    Sensitivity {
        get => this.get_Sensitivity()
        set => this.put_Sensitivity(value)
    }

    /**
     * Gets or sets a string that communicates the subject of the task. Subject is of type [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) and a maximum of 255 characters in length.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets or sets the starting date and time for the task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatask.startdate
     * @type {IReference<DateTime>} 
     */
    StartDate {
        get => this.get_StartDate()
        set => this.put_StartDate(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [UserDataTask](userdatatask.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTask")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ListId() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_ListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_RemoteId(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_CompletedDate() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_CompletedDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_CompletedDate(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_CompletedDate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Details() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Details()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Details(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_Details(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetailsKind() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_DetailsKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DetailsKind(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_DetailsKind(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_DueDate() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_DueDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_DueDate(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_DueDate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Priority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_Priority(value)
    }

    /**
     * 
     * @returns {UserDataTaskRecurrenceProperties} 
     */
    get_RecurrenceProperties() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_RecurrenceProperties()
    }

    /**
     * 
     * @param {UserDataTaskRecurrenceProperties} value 
     * @returns {HRESULT} 
     */
    put_RecurrenceProperties(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_RecurrenceProperties(value)
    }

    /**
     * 
     * @returns {UserDataTaskRegenerationProperties} 
     */
    get_RegenerationProperties() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_RegenerationProperties()
    }

    /**
     * 
     * @param {UserDataTaskRegenerationProperties} value 
     * @returns {HRESULT} 
     */
    put_RegenerationProperties(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_RegenerationProperties(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Reminder() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Reminder()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_Reminder(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_Reminder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Sensitivity() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Sensitivity()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Sensitivity(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_Sensitivity(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_Subject()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_Subject(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_StartDate() {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.get_StartDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_StartDate(value) {
        if (!this.HasProp("__IUserDataTask")) {
            if ((queryResult := this.QueryInterface(IUserDataTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTask := IUserDataTask(outPtr)
        }

        return this.__IUserDataTask.put_StartDate(value)
    }

;@endregion Instance Methods
}
