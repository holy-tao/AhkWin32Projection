#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoggingOptions.ahk
#Include .\ILoggingOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents advanced event settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoggingOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoggingOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new **LoggingOptions** instance with the specified keyword value.
     * @param {Integer} keywords The keyword value.
     * @returns {LoggingOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.#ctor
     */
    static CreateWithKeywords(keywords) {
        if (!LoggingOptions.HasProp("__ILoggingOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoggingOptionsFactory.IID)
            LoggingOptions.__ILoggingOptionsFactory := ILoggingOptionsFactory(factoryPtr)
        }

        return LoggingOptions.__ILoggingOptionsFactory.CreateWithKeywords(keywords)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the keyword value that represents the different categories that an event belongs to.
     * @remarks
     * Each bit represents a category that an event belongs to. Event Tracing for Windows (ETW) tools are able to filter events based on keyword.
     * 
     * > [!IMPORTANT]
     * > Only the lower 48 bits are available for user-defined event categories. The top eight bits of the keyword value are reserved for future definition and must be set to zero (0). The next eight bits are reserved by Microsoft.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.keywords
     * @type {Integer} 
     */
    Keywords {
        get => this.get_Keywords()
        set => this.put_Keywords(value)
    }

    /**
     * Gets or sets the user-defined metadata value attached to an event.
     * @remarks
     * The top four bits are reserved and must be set to zero (0).
     * 
     * Up to twenty-eight bits of user-defined information can be attached to an event as metadata. For example, user-defined metadata could be defined to act as instructions to a custom event processing tool to control event sampling, throttling, and so on.
     * 
     * For efficiency reasons, tags should be used for infrequently-changing metadata and not frequently-changing data.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.tags
     * @type {Integer} 
     */
    Tags {
        get => this.get_Tags()
        set => this.put_Tags(value)
    }

    /**
     * Gets or sets the user-defined value that identifies a larger unit of work within an application or component.
     * @remarks
     * This value corresponds to the Event Tracing for Windows (ETW) definition of a task. It is a user-defined value. A task is a larger unit of work within an application or component, i.e. it identifies a scope of work that is broader than an [Opcode](loggingopcode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.task
     * @type {Integer} 
     */
    Task {
        get => this.get_Task()
        set => this.put_Task(value)
    }

    /**
     * Gets or sets the operation code value for an event.
     * @remarks
     * This value corresponds to the Event Tracing for Windows (ETW) definition of an opcode. Most events should use the **Info** opcode.
     * 
     * The [LoggingActivity](loggingactivity.md) class will generate events with the **Opcode** set to **Start** and **Stop**.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.opcode
     * @type {Integer} 
     */
    Opcode {
        get => this.get_Opcode()
        set => this.put_Opcode(value)
    }

    /**
     * Gets or sets the unique identifier associated with an activity.
     * @remarks
     * This value corresponds to the Event Tracing for Windows (ETW) definition of an activity id. You will normally use the [LoggingActivity](loggingactivity.md) class to automatically manage this value instead of setting it manually.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
        set => this.put_ActivityId(value)
    }

    /**
     * Gets or sets a value that uniquely identifies the parent activity to which this activity is related.
     * @remarks
     * This value corresponds to the Event Tracing for Windows (ETW) definition of a related activity id. You will normally use the [LoggingActivity](loggingactivity.md) class to automatically manage this value instead of setting it manually.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingoptions.relatedactivityid
     * @type {Guid} 
     */
    RelatedActivityId {
        get => this.get_RelatedActivityId()
        set => this.put_RelatedActivityId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new **LoggingOptions** instance with default option values.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Keywords() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_Keywords()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Keywords(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_Keywords(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Tags() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_Tags()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Tags(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_Tags(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Task() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_Task()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Task(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_Task(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Opcode() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_Opcode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Opcode(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_Opcode(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_ActivityId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_ActivityId(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_ActivityId(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RelatedActivityId() {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.get_RelatedActivityId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_RelatedActivityId(value) {
        if (!this.HasProp("__ILoggingOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingOptions := ILoggingOptions(outPtr)
        }

        return this.__ILoggingOptions.put_RelatedActivityId(value)
    }

;@endregion Instance Methods
}
