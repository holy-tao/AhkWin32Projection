#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NETCON_MEDIATYPE.ahk
#Include .\NETCON_STATUS.ahk

/**
 * The NETCON_PROPERTIES structure stores values that describe the properties of a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ns-netcon-netcon_properties
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NETCON_PROPERTIES extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

    /**
     * Globally-unique identifier (GUID) for this connection.
     * @type {Guid}
     */
    guidId {
        get {
            if(!this.HasProp("__guidId"))
                this.__guidId := Guid(0, this)
            return this.__guidId
        }
    }

    /**
     * Name of the connection itself.
     * @type {PWSTR}
     */
    pszwName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Name of the device associated with the connection.
     * @type {PWSTR}
     */
    pszwDeviceName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_status">Current status</a> of the connection.
     * @type {NETCON_STATUS}
     */
    Status {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">Media type</a> associated with this connection.
     * @type {NETCON_MEDIATYPE}
     */
    MediaType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_characteristic_flags">Characteristics</a> for this connection.
     * @type {Integer}
     */
    dwCharacter {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Class identifier for the connection object.
     * @type {Guid}
     */
    clsidThisObject {
        get {
            if(!this.HasProp("__clsidThisObject"))
                this.__clsidThisObject := Guid(44, this)
            return this.__clsidThisObject
        }
    }

    /**
     * Class identifier for the user-interface object.
     * @type {Guid}
     */
    clsidUiObject {
        get {
            if(!this.HasProp("__clsidUiObject"))
                this.__clsidUiObject := Guid(60, this)
            return this.__clsidUiObject
        }
    }
}
