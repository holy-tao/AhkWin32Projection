#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQCOLUMNSET {
    #StructPack 8

    cCol : UInt32

    aCol : IntPtr

}
