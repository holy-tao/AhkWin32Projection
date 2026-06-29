#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import "..\..\Security\SECURITY_DESCRIPTOR_CONTROL.ahk" { SECURITY_DESCRIPTOR_CONTROL }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Security\SECURITY_DESCRIPTOR_RELATIVE.ahk" { SECURITY_DESCRIPTOR_RELATIVE }

/**
 * Describes a security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_security_descriptor
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_SECURITY_DESCRIPTOR {
    #StructPack 4

    Base : CLUSPROP_VALUE

    sd : SECURITY_DESCRIPTOR_RELATIVE

    static __New() {
        DefineProp(this.Prototype, 'rgbSecurityDescriptor', { type: Int8[1], offset: 12 })
        this.DeleteProp("__New")
    }
}
