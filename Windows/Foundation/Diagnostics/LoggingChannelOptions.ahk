#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoggingChannelOptions.ahk
#Include .\ILoggingChannelOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents advanced settings that you can use to configure a [LoggingChannel](loggingchannel.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingchanneloptions
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class LoggingChannelOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoggingChannelOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoggingChannelOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [LoggingChannelOptions](loggingchanneloptions.md) object with all properties set to default values except for the specified group.
     * @param {Guid} group The group identifier.
     * @returns {LoggingChannelOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingchanneloptions.#ctor
     */
    static Create(group) {
        if (!LoggingChannelOptions.HasProp("__ILoggingChannelOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingChannelOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILoggingChannelOptionsFactory.IID)
            LoggingChannelOptions.__ILoggingChannelOptionsFactory := ILoggingChannelOptionsFactory(factoryPtr)
        }

        return LoggingChannelOptions.__ILoggingChannelOptionsFactory.Create(group)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the channel group identifier.
     * @remarks
     * A channel can be a member of one group. Membership in a group indicates that the channel implements a specific set of behaviors. An Event Tracing for Windows (ETW) processing tool that can process groups could locate active channels that belong to a particular group, and could use knowledge of a group’s behaviors to route or manipulate the channel’s events.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.loggingchanneloptions.group
     * @type {Guid} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [LoggingChannelOptions](loggingchanneloptions.md) object with all options set to default values.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.LoggingChannelOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Group() {
        if (!this.HasProp("__ILoggingChannelOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingChannelOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingChannelOptions := ILoggingChannelOptions(outPtr)
        }

        return this.__ILoggingChannelOptions.get_Group()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if (!this.HasProp("__ILoggingChannelOptions")) {
            if ((queryResult := this.QueryInterface(ILoggingChannelOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoggingChannelOptions := ILoggingChannelOptions(outPtr)
        }

        return this.__ILoggingChannelOptions.put_Group(value)
    }

;@endregion Instance Methods
}
