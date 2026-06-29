#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct DIACTIONW {
    #StructPack 8

    uAppData : IntPtr

    dwSemantic : UInt32

    dwFlags : UInt32

    lptszActionName : PWSTR

    guidInstance : Guid

    dwObjID : UInt32

    dwHow : UInt32

    static __New() {
        DefineProp(this.Prototype, 'uResIdString', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
