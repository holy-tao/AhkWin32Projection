#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include ..\..\Security\SECURITY_DESCRIPTOR_RELATIVE.ahk

/**
 * Describes a security descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusprop_security_descriptor
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_SECURITY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * @type {SECURITY_DESCRIPTOR_RELATIVE}
     */
    sd{
        get {
            if(!this.HasProp("__sd"))
                this.__sd := SECURITY_DESCRIPTOR_RELATIVE(this.ptr + 16)
            return this.__sd
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgbSecurityDescriptor{
        get {
            if(!this.HasProp("__rgbSecurityDescriptorProxyArray"))
                this.__rgbSecurityDescriptorProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__rgbSecurityDescriptorProxyArray
        }
    }
}
