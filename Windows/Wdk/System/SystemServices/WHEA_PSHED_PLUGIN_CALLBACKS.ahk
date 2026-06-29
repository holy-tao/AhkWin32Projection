#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PSHED_PLUGIN_CALLBACKS {
    #StructPack 8

    GetAllErrorSources : IntPtr

    Reserved : IntPtr

    GetErrorSourceInfo : IntPtr

    SetErrorSourceInfo : IntPtr

    EnableErrorSource : IntPtr

    DisableErrorSource : IntPtr

    WriteErrorRecord : IntPtr

    ReadErrorRecord : IntPtr

    ClearErrorRecord : IntPtr

    RetrieveErrorInfo : IntPtr

    FinalizeErrorRecord : IntPtr

    ClearErrorStatus : IntPtr

    AttemptRecovery : IntPtr

    GetInjectionCapabilities : IntPtr

    InjectError : IntPtr

}
