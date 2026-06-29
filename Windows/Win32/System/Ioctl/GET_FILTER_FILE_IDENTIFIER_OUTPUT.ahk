#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GET_FILTER_FILE_IDENTIFIER_OUTPUT {
    #StructPack 2

    FilterFileIdentifierLength : UInt16

    FilterFileIdentifier : Int8[1]

}
