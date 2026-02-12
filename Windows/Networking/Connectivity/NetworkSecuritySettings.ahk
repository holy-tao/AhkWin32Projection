#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkSecuritySettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Exposes the authentication and encryption types applied to a connection (primarily meaningful for Wi-Fi and other wireless links).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networksecuritysettings
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkSecuritySettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkSecuritySettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkSecuritySettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves the type of authentication used by the network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networksecuritysettings.networkauthenticationtype
     * @type {Integer} 
     */
    NetworkAuthenticationType {
        get => this.get_NetworkAuthenticationType()
    }

    /**
     * Retrieves the type of encryption used by the network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networksecuritysettings.networkencryptiontype
     * @type {Integer} 
     */
    NetworkEncryptionType {
        get => this.get_NetworkEncryptionType()
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
    get_NetworkAuthenticationType() {
        if (!this.HasProp("__INetworkSecuritySettings")) {
            if ((queryResult := this.QueryInterface(INetworkSecuritySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkSecuritySettings := INetworkSecuritySettings(outPtr)
        }

        return this.__INetworkSecuritySettings.get_NetworkAuthenticationType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkEncryptionType() {
        if (!this.HasProp("__INetworkSecuritySettings")) {
            if ((queryResult := this.QueryInterface(INetworkSecuritySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkSecuritySettings := INetworkSecuritySettings(outPtr)
        }

        return this.__INetworkSecuritySettings.get_NetworkEncryptionType()
    }

;@endregion Instance Methods
}
