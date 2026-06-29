#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DBGKD_GET_VERSION64 {
    #StructPack 8

    MajorVersion : UInt16

    MinorVersion : UInt16

    ProtocolVersion : Int8

    KdSecondaryVersion : Int8

    Flags : UInt16

    MachineType : UInt16

    MaxPacketType : Int8

    MaxStateChange : Int8

    MaxManipulate : Int8

    Simulation : Int8

    Unused : UInt16[1]

    KernBase : Int64

    PsLoadedModuleList : Int64

    DebuggerDataList : Int64

}
