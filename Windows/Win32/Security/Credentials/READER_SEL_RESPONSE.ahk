#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct READER_SEL_RESPONSE {
    #StructPack 4

    cbReaderNameOffset : UInt32

    cchReaderNameLength : UInt32

    cbCardNameOffset : UInt32

    cchCardNameLength : UInt32

}
