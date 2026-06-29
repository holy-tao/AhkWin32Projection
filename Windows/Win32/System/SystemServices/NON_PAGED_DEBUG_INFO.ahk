#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct NON_PAGED_DEBUG_INFO {
    #StructPack 8

    Signature : UInt16

    Flags : UInt16

    Size : UInt32

    Machine : UInt16

    Characteristics : UInt16

    TimeDateStamp : UInt32

    CheckSum : UInt32

    SizeOfImage : UInt32

    ImageBase : Int64

}
