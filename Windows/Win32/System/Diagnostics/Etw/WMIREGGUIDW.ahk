#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WMIREGGUIDW {
    #StructPack 8

    Guid : Guid

    Flags : UInt32

    InstanceCount : UInt32

    InstanceNameList : UInt32

    static __New() {
        DefineProp(this.Prototype, 'BaseNameOffset', { type: UInt32, offset: 24 })
        DefineProp(this.Prototype, 'Pdo', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'InstanceInfo', { type: IntPtr, offset: 24 })
        this.DeleteProp("__New")
    }
}
