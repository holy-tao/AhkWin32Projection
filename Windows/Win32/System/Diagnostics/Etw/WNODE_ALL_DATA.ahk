#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WNODE_HEADER.ahk" { WNODE_HEADER }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\OFFSETINSTANCEDATAANDLENGTH.ahk" { OFFSETINSTANCEDATAANDLENGTH }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WNODE_ALL_DATA {
    #StructPack 8

    WnodeHeader : WNODE_HEADER

    DataBlockOffset : UInt32

    InstanceCount : UInt32

    OffsetInstanceNameOffsets : UInt32

    FixedInstanceSize : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OffsetInstanceDataAndLength', { type: OFFSETINSTANCEDATAANDLENGTH[1], offset: 60 })
        this.DeleteProp("__New")
    }
}
