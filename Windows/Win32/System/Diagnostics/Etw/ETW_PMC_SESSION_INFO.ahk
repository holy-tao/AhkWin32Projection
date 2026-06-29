#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_PMC_SESSION_INFO {
    #StructPack 4

    NextEntryOffset : UInt32

    LoggerId : UInt16

    Reserved : UInt16

    ProfileSourceCount : UInt32

    HookIdCount : UInt32

}
