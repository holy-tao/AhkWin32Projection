#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_ERROR_RECORD_SECTION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ERROR_RECORD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_ERROR_RECORD_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<WHEA_ERROR_RECORD_SECTION_DESCRIPTOR>}
     */
    SectionDescriptor{
        get {
            if(!this.HasProp("__SectionDescriptorProxyArray"))
                this.__SectionDescriptorProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__SectionDescriptorProxyArray
        }
    }
}
