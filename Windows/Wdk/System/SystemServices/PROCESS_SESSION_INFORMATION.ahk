#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_SESSION_INFORMATION {
    #StructPack 4

    SessionId : UInt32

}
