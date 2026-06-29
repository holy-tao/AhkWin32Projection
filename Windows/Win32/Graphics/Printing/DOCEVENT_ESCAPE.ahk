#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DOCEVENT_ESCAPE {
    #StructPack 8

    iEscape : Int32

    cjInput : Int32

    pvInData : IntPtr

}
