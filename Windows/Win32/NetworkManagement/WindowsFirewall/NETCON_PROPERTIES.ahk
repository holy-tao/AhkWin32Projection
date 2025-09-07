#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The NETCON_PROPERTIES structure stores values that describe the properties of a network connection.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/ns-netcon-netcon_properties
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETCON_PROPERTIES extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Globally-unique identifier (GUID) for this connection.
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Name of the connection itself.
     * @type {PWSTR}
     */
    pszwName{
        get {
            if(!this.HasProp("__pszwName"))
                this.__pszwName := PWSTR(this.ptr + 8)
            return this.__pszwName
        }
    }

    /**
     * Name of the device associated with the connection.
     * @type {PWSTR}
     */
    pszwDeviceName{
        get {
            if(!this.HasProp("__pszwDeviceName"))
                this.__pszwDeviceName := PWSTR(this.ptr + 16)
            return this.__pszwDeviceName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_status">Current status</a> of the connection.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_mediatype">Media type</a> associated with this connection.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ne-netcon-netcon_characteristic_flags">Characteristics</a> for this connection.
     * @type {Integer}
     */
    dwCharacter {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Class identifier for the connection object.
     * @type {Pointer<Guid>}
     */
    clsidThisObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Class identifier for the user-interface object.
     * @type {Pointer<Guid>}
     */
    clsidUiObject {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
