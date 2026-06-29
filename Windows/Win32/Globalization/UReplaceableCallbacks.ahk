#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UReplaceableCallbacks {
    #StructPack 8

    length : IntPtr

    charAt : IntPtr

    char32At : IntPtr

    replace : IntPtr

    extract : IntPtr

    copy : IntPtr

}
