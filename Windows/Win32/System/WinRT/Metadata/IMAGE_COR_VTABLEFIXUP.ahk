#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_VTABLEFIXUP {
    #StructPack 4

    RVA : UInt32

    Count : UInt16

    Type : UInt16

}
