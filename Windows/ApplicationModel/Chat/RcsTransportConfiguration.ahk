#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsTransportConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the configuration of a Rich Communication Services (RCS) transport.
 * @remarks
 * The [Configuration](rcstransport_configuration.md) property of the [RcsTransport](rcstransport.md) class references an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsTransportConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsTransportConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsTransportConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of attachments supported by the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.maxattachmentcount
     * @type {Integer} 
     */
    MaxAttachmentCount {
        get => this.get_MaxAttachmentCount()
    }

    /**
     * Gets the maximum size of a chat message supported by the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.maxmessagesizeinkilobytes
     * @type {Integer} 
     */
    MaxMessageSizeInKilobytes {
        get => this.get_MaxMessageSizeInKilobytes()
    }

    /**
     * Gets the maximum size of a group chat message supported by the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.maxgroupmessagesizeinkilobytes
     * @type {Integer} 
     */
    MaxGroupMessageSizeInKilobytes {
        get => this.get_MaxGroupMessageSizeInKilobytes()
    }

    /**
     * Gets the maximum number of recipients supported for a group chat.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.maxrecipientcount
     * @type {Integer} 
     */
    MaxRecipientCount {
        get => this.get_MaxRecipientCount()
    }

    /**
     * Gets the maximum size of a file that can be sent using the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.maxfilesizeinkilobytes
     * @type {Integer} 
     */
    MaxFileSizeInKilobytes {
        get => this.get_MaxFileSizeInKilobytes()
    }

    /**
     * Gets the size at which the user should be warned that they are attaching a large file for the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcstransportconfiguration.warningfilesizeinkilobytes
     * @type {Integer} 
     */
    WarningFileSizeInKilobytes {
        get => this.get_WarningFileSizeInKilobytes()
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
    get_MaxAttachmentCount() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_MaxAttachmentCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageSizeInKilobytes() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_MaxMessageSizeInKilobytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxGroupMessageSizeInKilobytes() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_MaxGroupMessageSizeInKilobytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRecipientCount() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_MaxRecipientCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxFileSizeInKilobytes() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_MaxFileSizeInKilobytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WarningFileSizeInKilobytes() {
        if (!this.HasProp("__IRcsTransportConfiguration")) {
            if ((queryResult := this.QueryInterface(IRcsTransportConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsTransportConfiguration := IRcsTransportConfiguration(outPtr)
        }

        return this.__IRcsTransportConfiguration.get_WarningFileSizeInKilobytes()
    }

;@endregion Instance Methods
}
