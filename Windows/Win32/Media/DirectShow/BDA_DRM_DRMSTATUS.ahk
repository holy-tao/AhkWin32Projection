#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_DRM_DRMSTATUS extends Win32Struct {
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
     * @type {Guid}
     */
    DRMuuid {
        get {
            if(!this.HasProp("__DRMuuid"))
                this.__DRMuuid := Guid(4, this)
            return this.__DRMuuid
        }
    }

    /**
     * @type {Integer}
     */
    ulDrmUuidListStringSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Pointer>}
     */
    argbDrmUuidListString {
        get {
            if(!this.HasProp("__argbDrmUuidListStringProxyArray"))
                this.__argbDrmUuidListStringProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "ptr")
            return this.__argbDrmUuidListStringProxyArray
        }
    }
}
