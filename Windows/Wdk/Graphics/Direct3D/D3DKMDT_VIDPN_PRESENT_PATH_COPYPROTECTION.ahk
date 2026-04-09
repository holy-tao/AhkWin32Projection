#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION extends Win32Struct {
    static sizeof => 272

    static packingSize => 8

    /**
     * @type {D3DKMDT_VIDPN_PRESENT_PATH_COPYPROTECTION_TYPE}
     */
    CopyProtectionType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    APSTriggerBits {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    OEMCopyProtection {
        get {
            if(!this.HasProp("__OEMCopyProtectionProxyArray"))
                this.__OEMCopyProtectionProxyArray := Win32FixedArray(this.ptr + 8, 256, Primitive, "char")
            return this.__OEMCopyProtectionProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    CopyProtectionSupport {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }
}
