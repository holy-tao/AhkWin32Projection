#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains values that describe return parameters for the Identify Directive.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_directive_identify_return_parameters_descriptor
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DIRECTIVE_IDENTIFY_RETURN_PARAMETERS_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 1, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
