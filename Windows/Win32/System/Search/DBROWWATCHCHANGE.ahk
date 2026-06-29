#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBROWWATCHCHANGE {
    #StructPack 8

    hRegion : IntPtr

    eChangeKind : UInt32

    hRow : IntPtr

    iRow : IntPtr

}
