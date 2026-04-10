#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_VALUE.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include ..\..\Security\SECURITY_DESCRIPTOR_RELATIVE.ahk
#Include ..\..\Security\SECURITY_DESCRIPTOR_CONTROL.ahk

/**
 * Describes a security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_security_descriptor
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSPROP_SECURITY_DESCRIPTOR extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base {
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * @type {SECURITY_DESCRIPTOR_RELATIVE}
     */
    sd {
        get {
            if(!this.HasProp("__sd"))
                this.__sd := SECURITY_DESCRIPTOR_RELATIVE(12, this)
            return this.__sd
        }
    }

    /**
     * @type {Array<Integer>}
     */
    rgbSecurityDescriptor {
        get {
            if(!this.HasProp("__rgbSecurityDescriptorProxyArray"))
                this.__rgbSecurityDescriptorProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__rgbSecurityDescriptorProxyArray
        }
    }
}
