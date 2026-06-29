#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct KQUEUE {
    #StructPack 8

    Header : IntPtr

    EntryListHead : IntPtr

    CurrentCount : UInt32

    MaximumCount : UInt32

    ThreadListHead : IntPtr

}
