#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMEUCT.ahk" { IMEUCT }

/**
 * Contains data about a word in the Word data of the Microsoft IME dictionary.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imewrd
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEWRD {
    #StructPack 8

    /**
     * The reading string.
     */
    pwchReading : PWSTR

    /**
     * The display string.
     */
    pwchDisplay : PWSTR

    ulPos : UInt32

    /**
     * Reserved.
     */
    rgulAttrs : UInt32[2]

    /**
     * Size of the comment, in bytes, of <b>pvComment</b>.
     */
    cbComment : Int32

    /**
     * Type of comment. This must be one of the values of the <a href="https://docs.microsoft.com/windows/desktop/api/msime/ne-msime-imeuct">IMEUCT</a> enumeration.
     */
    uct : IMEUCT

    /**
     * Comment string.
     */
    pvComment : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'nPos1', { type: UInt16, offset: 16 })
        DefineProp(this.Prototype, 'nPos2', { type: UInt16, offset: 18 })
        this.DeleteProp("__New")
    }
}
