#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DiagnosticsInfo structure contains the estimate of diagnosis time, and flags for invocation.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-diagnosticsinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class DiagnosticsInfo extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>long</b>
     * 
     * The length of time, in seconds, that the diagnosis should take to complete. A value of zero or a negative value  means the cost is negligible. Any positive value will cause the engine to adjust the overall diagnostics process.
     * @type {Integer}
     */
    cost {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
