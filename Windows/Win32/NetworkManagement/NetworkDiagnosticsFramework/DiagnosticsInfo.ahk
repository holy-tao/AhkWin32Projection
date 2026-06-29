#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DiagnosticsInfo structure contains the estimate of diagnosis time, and flags for invocation.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-diagnosticsinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct DiagnosticsInfo {
    #StructPack 4

    /**
     * Type: <b>long</b>
     * 
     * The length of time, in seconds, that the diagnosis should take to complete. A value of zero or a negative value  means the cost is negligible. Any positive value will cause the engine to adjust the overall diagnostics process.
     */
    cost : Int32

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved.
     */
    flags : UInt32

}
