#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AVITIMEDINDEX_ENTRY {
    #StructPack 4

    dwOffset : UInt32

    dwSize : UInt32

    dwDuration : UInt32

}
