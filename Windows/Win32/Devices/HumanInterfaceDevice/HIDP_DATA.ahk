#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_DATA {
    #StructPack 4

    DataIndex : UInt16

    Reserved : UInt16

    RawValue : UInt32

    static __New() {
        DefineProp(this.Prototype, 'On', { type: BOOLEAN, offset: 4 })
        this.DeleteProp("__New")
    }
}
