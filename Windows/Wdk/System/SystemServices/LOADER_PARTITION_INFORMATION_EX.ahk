#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct LOADER_PARTITION_INFORMATION_EX {
    #StructPack 4

    PartitionStyle : UInt32

    PartitionNumber : UInt32

    Signature : UInt32

    Flags : UInt32

    static __New() {
        DefineProp(this.Prototype, 'DeviceId', { type: Guid, offset: 8 })
        this.DeleteProp("__New")
    }
}
