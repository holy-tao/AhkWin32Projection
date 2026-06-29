#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class BranchOfficeLogOfflineFileFull extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pMachineName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
