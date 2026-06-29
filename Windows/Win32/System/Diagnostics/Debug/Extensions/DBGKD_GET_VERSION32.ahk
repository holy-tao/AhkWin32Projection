#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DBGKD_GET_VERSION32 {
    #StructPack 4

    MajorVersion : UInt16

    MinorVersion : UInt16

    ProtocolVersion : UInt16

    Flags : UInt16

    KernBase : UInt32

    PsLoadedModuleList : UInt32

    MachineType : UInt16

    ThCallbackStack : UInt16

    NextCallback : UInt16

    FramePointer : UInt16

    KiCallUserMode : UInt32

    KeUserCallbackDispatcher : UInt32

    BreakpointWithStatus : UInt32

    DebuggerDataList : UInt32

}
