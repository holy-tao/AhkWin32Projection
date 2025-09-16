#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NETRESOURCEA.ahk

/**
 * The NOTIFYADD structure contains the details of a network connect operation. It is used by the AddConnectNotify function.
 * @see https://learn.microsoft.com/windows/win32/api/npapi/ns-npapi-notifyadd
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NOTIFYADD extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A handle to a window which should own any messages or dialog boxes the application receiving the notification might display.
     * @type {Pointer<HWND>}
     */
    hwndOwner {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the network resource to connect to. The valid fields are the same as for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a> function.
     * @type {NETRESOURCEA}
     */
    NetResource{
        get {
            if(!this.HasProp("__NetResource"))
                this.__NetResource := NETRESOURCEA(this.ptr + 8)
            return this.__NetResource
        }
    }

    /**
     * 
     * @type {Integer}
     */
    dwAddFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
