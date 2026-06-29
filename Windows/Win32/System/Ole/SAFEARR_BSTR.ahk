#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\FLAGGED_WORD_BLOB.ahk" { FLAGGED_WORD_BLOB }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct SAFEARR_BSTR {
    #StructPack 8

    Size : UInt32

    aBstr : IntPtr

}
