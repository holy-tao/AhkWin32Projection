#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SCRUB_DATA_INPUT {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    MaximumIos : UInt32

    ObjectId : UInt32[4]

    StartingByteOffset : Int64

    ByteCount : Int64

    Reserved : UInt32[36]

    ResumeContext : Int8[1040]

}
