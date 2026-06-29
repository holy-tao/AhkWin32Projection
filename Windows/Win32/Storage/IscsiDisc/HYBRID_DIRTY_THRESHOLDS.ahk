#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct HYBRID_DIRTY_THRESHOLDS {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    DirtyLowThreshold : UInt32

    DirtyHighThreshold : UInt32

}
