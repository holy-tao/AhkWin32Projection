#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeLogOfflineFileFull extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PWSTR(this.ptr + 0)
            return this.__pMachineName
        }
    }
}
