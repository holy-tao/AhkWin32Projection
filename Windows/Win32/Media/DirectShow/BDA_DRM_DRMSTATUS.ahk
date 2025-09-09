#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_DRM_DRMSTATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DRMuuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulDrmUuidListStringSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Guid>}
     */
    argbDrmUuidListString{
        get {
            if(!this.HasProp("__argbDrmUuidListStringProxyArray"))
                this.__argbDrmUuidListStringProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "ptr")
            return this.__argbDrmUuidListStringProxyArray
        }
    }
}
