#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class RESOURCE_TERMINAL_FAILURE_INFO_BUFFER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    isTerminalFailure {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    restartPeriodRemaining {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
