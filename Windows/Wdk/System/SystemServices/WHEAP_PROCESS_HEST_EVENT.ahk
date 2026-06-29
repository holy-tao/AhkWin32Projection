#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PROCESS_HEST_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Error : CHAR[32]

    EntryType : CHAR[32]

    EntryIndex : UInt32

    HestValid : BOOLEAN

    CmcCount : UInt32

    MceCount : UInt32

    NmiCount : UInt32

    AerRootCount : UInt32

    AerBridgeCount : UInt32

    AerEndPointCount : UInt32

    GenericV1Count : UInt32

    GenericV2Count : UInt32

}
