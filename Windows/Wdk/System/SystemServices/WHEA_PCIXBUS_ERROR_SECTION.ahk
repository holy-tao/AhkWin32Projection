#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIXBUS_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    ErrorStatus : IntPtr

    ErrorType : UInt16

    BusId : IntPtr

    Reserved : UInt32

    BusAddress : Int64

    BusData : Int64

    BusCommand : IntPtr

    RequesterId : Int64

    CompleterId : Int64

    TargetId : Int64

}
