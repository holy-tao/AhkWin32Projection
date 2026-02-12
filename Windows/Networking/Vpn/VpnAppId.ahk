#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnAppId.ahk
#Include .\IVpnAppIdFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an application identifier, which can be a file path, a package family name, or a fully qualified binary name (FQBN) string.
 * @remarks
 * The app ID for a Win32 app is either a file path or a Fully Qualified Binary Name (FQBN). For other apps, the app ID is the Package Family Name.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnappid
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnAppId extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnAppId

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnAppId.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a **VpnAppId** object with specified app ID and type.
     * @param {Integer} type The type of app ID to be created.
     * @param {HSTRING} value The value of the app ID to be created. Value must be correct for the given *type* value.
     * @returns {VpnAppId} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnappid.#ctor
     */
    static Create(type, value) {
        if (!VpnAppId.HasProp("__IVpnAppIdFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnAppId")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnAppIdFactory.IID)
            VpnAppId.__IVpnAppIdFactory := IVpnAppIdFactory(factoryPtr)
        }

        return VpnAppId.__IVpnAppIdFactory.Create(type, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of the app ID.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnappid.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the value of the app ID.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnappid.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
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
    get_Type() {
        if (!this.HasProp("__IVpnAppId")) {
            if ((queryResult := this.QueryInterface(IVpnAppId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnAppId := IVpnAppId(outPtr)
        }

        return this.__IVpnAppId.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IVpnAppId")) {
            if ((queryResult := this.QueryInterface(IVpnAppId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnAppId := IVpnAppId(outPtr)
        }

        return this.__IVpnAppId.put_Type(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IVpnAppId")) {
            if ((queryResult := this.QueryInterface(IVpnAppId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnAppId := IVpnAppId(outPtr)
        }

        return this.__IVpnAppId.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IVpnAppId")) {
            if ((queryResult := this.QueryInterface(IVpnAppId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnAppId := IVpnAppId(outPtr)
        }

        return this.__IVpnAppId.put_Value(value)
    }

;@endregion Instance Methods
}
