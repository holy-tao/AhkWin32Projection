#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PROCESS_REVOKE_FILE_HANDLES_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    TargetDevicePath {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
