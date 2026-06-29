#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_ERROR_LOG_MESSAGE {
    #StructPack 8

    Type : UInt16

    Size : UInt16

    DriverNameLength : UInt16

    TimeStamp : Int64

    DriverNameOffset : UInt32

    EntryData : IntPtr

}
