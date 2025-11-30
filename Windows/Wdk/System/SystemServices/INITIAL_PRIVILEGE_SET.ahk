#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk
#Include ..\..\..\Win32\Security\LUID_AND_ATTRIBUTES.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class INITIAL_PRIVILEGE_SET extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PrivilegeCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Control {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<LUID_AND_ATTRIBUTES>}
     */
    Privilege{
        get {
            if(!this.HasProp("__PrivilegeProxyArray"))
                this.__PrivilegeProxyArray := Win32FixedArray(this.ptr + 8, 3, LUID_AND_ATTRIBUTES, "")
            return this.__PrivilegeProxyArray
        }
    }
}
