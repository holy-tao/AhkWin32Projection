#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IMAGE_POLICY_ENTRY.ahk
#Include .\IMAGE_POLICY_ENTRY_TYPE.ahk
#Include .\IMAGE_POLICY_ID.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class IMAGE_POLICY_METADATA extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 7, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ApplicationId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {IMAGE_POLICY_ENTRY}
     */
    Policies {
        get {
            if(!this.HasProp("__PoliciesProxyArray"))
                this.__PoliciesProxyArray := Win32FixedArray(this.ptr + 16, 1, IMAGE_POLICY_ENTRY, "")
            return this.__PoliciesProxyArray
        }
    }
}
