#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct COR_GC_STATS {
    #StructPack 8

    Flags : UInt32

    ExplicitGCCount : IntPtr

    GenCollectionsTaken : IntPtr[3]

    CommittedKBytes : IntPtr

    ReservedKBytes : IntPtr

    Gen0HeapSizeKBytes : IntPtr

    Gen1HeapSizeKBytes : IntPtr

    Gen2HeapSizeKBytes : IntPtr

    LargeObjectHeapSizeKBytes : IntPtr

    KBytesPromotedFromGen0 : IntPtr

    KBytesPromotedFromGen1 : IntPtr

}
