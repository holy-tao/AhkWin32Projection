#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct CADATE {
    #StructPack 8

    cElems : UInt32

    pElems : IntPtr

}
