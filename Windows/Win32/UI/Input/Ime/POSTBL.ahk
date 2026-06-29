#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An entry in the public POS (Part of Speech) table.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-postbl
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct POSTBL {
    #StructPack 8

    /**
     * The number of the part of speech.
     */
    nPos : UInt16

    /**
     * The name of the part of speech.
     */
    szName : IntPtr

}
