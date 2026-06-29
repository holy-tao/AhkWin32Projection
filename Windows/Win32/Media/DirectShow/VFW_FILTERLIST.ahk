#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VFW_FILTERLIST {
    #StructPack 8

    cFilters : UInt32

    aClsId : IntPtr[1]

}
