#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOMAIN_CONFIGURATION_ARCH.ahk" { DOMAIN_CONFIGURATION_ARCH }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DOMAIN_CONFIGURATION {
    #StructPack 8

    Type : DOMAIN_CONFIGURATION_ARCH

    Arm64 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'X64', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
