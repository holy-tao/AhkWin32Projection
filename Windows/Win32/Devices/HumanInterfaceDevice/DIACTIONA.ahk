#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct DIACTIONA {
    #StructPack 8

    uAppData : IntPtr

    dwSemantic : UInt32

    dwFlags : UInt32

    lptszActionName : PSTR

    guidInstance : Guid

    dwObjID : UInt32

    dwHow : UInt32

    static __New() {
        DefineProp(this.Prototype, 'uResIdString', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
