#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILanIdentifierData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the port specific data that enables LAN locality capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifierdata
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class LanIdentifierData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILanIdentifierData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILanIdentifierData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the type of data stored in the value field of the [LanIdentifierData](lanidentifierdata.md) object according to the Link Layer Discovery Protocol (LLDP) protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifierdata.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the serialized value.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifierdata.value
     * @type {IVectorView<Integer>} 
     */
    Value {
        get => this.get_Value()
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
        if (!this.HasProp("__ILanIdentifierData")) {
            if ((queryResult := this.QueryInterface(ILanIdentifierData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanIdentifierData := ILanIdentifierData(outPtr)
        }

        return this.__ILanIdentifierData.get_Type()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_Value() {
        if (!this.HasProp("__ILanIdentifierData")) {
            if ((queryResult := this.QueryInterface(ILanIdentifierData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanIdentifierData := ILanIdentifierData(outPtr)
        }

        return this.__ILanIdentifierData.get_Value()
    }

;@endregion Instance Methods
}
