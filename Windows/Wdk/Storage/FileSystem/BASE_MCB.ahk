#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct BASE_MCB {
    #StructPack 8

    MaximumPairCount : UInt32

    PairCount : UInt32

    PoolType : UInt16

    Flags : UInt16

    Mapping : IntPtr

}
