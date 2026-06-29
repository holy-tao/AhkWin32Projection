#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RESOURCE_PERFORMANCE_DATA {
    #StructPack 8

    ActiveResourceCount : UInt32

    TotalResourceCount : UInt32

    ExclusiveAcquire : UInt32

    SharedFirstLevel : UInt32

    SharedSecondLevel : UInt32

    StarveFirstLevel : UInt32

    StarveSecondLevel : UInt32

    WaitForExclusive : UInt32

    OwnerTableExpands : UInt32

    MaximumTableExpand : UInt32

    HashTable : IntPtr[64]

}
