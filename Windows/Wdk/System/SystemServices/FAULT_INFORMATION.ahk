#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAULT_INFORMATION_ARCH.ahk" { FAULT_INFORMATION_ARCH }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FAULT_INFORMATION {
    #StructPack 8

    Type : FAULT_INFORMATION_ARCH

    IsStage1 : BOOLEAN

    Arm64 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'X64', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
