#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEV_BROADCAST_HDR.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class VolLockBroadcast extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {DEV_BROADCAST_HDR}
     */
    vlb_dbh{
        get {
            if(!this.HasProp("__vlb_dbh"))
                this.__vlb_dbh := DEV_BROADCAST_HDR(this.ptr + 0)
            return this.__vlb_dbh
        }
    }

    /**
     * @type {Integer}
     */
    vlb_owner {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    vlb_perms {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    vlb_lockType {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    vlb_drive {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    vlb_flags {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }
}
