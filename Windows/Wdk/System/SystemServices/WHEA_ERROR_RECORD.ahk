#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_RECORD extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    SectionDescriptor {
        get {
            if(!this.HasProp("__SectionDescriptorProxyArray"))
                this.__SectionDescriptorProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__SectionDescriptorProxyArray
        }
    }
}
