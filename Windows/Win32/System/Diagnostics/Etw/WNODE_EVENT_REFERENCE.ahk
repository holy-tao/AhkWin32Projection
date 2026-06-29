#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WNODE_HEADER.ahk" { WNODE_HEADER }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WNODE_EVENT_REFERENCE {
    #StructPack 8

    WnodeHeader : WNODE_HEADER

    TargetGuid : Guid

    TargetDataBlockSize : UInt32

    TargetInstanceIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'TargetInstanceName', { type: WCHAR[1], offset: 68 })
        this.DeleteProp("__New")
    }
}
