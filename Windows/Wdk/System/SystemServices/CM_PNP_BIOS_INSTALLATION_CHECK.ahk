#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_PNP_BIOS_INSTALLATION_CHECK {
    #StructPack 4

    Signature : Int8[4]

    Revision : Int8

    Length : Int8

    ControlField : UInt16

    Checksum : Int8

    EventFlagAddress : UInt32

    RealModeEntryOffset : UInt16

    RealModeEntrySegment : UInt16

    ProtectedModeEntryOffset : UInt16

    ProtectedModeCodeBaseAddress : UInt32

    OemDeviceId : UInt32

    RealModeDataBaseAddress : UInt16

    ProtectedModeDataBaseAddress : UInt32

}
