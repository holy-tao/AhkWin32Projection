#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The header of an opened user dictionary file. Used to get the user dictionary's properties, such as version, title, description, and copyright.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-imeshf
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMESHF {
    #StructPack 2

    /**
     * The size of this structure. You must set this value before using the structure.
     */
    cbShf : UInt16

    /**
     * Dictionary version.
     */
    verDic : UInt16

    /**
     * Dictionary title.
     */
    szTitle : CHAR[48]

    /**
     * Dictionary description.
     */
    szDescription : CHAR[256]

    /**
     * Dictionary copyright information.
     */
    szCopyright : CHAR[128]

}
