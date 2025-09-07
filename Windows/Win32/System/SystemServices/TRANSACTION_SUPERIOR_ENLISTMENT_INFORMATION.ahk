#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSACTION_ENLISTMENT_PAIR.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TRANSACTION_SUPERIOR_ENLISTMENT_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {TRANSACTION_ENLISTMENT_PAIR}
     */
    SuperiorEnlistmentPair{
        get {
            if(!this.HasProp("__SuperiorEnlistmentPair"))
                this.__SuperiorEnlistmentPair := TRANSACTION_ENLISTMENT_PAIR(this.ptr + 0)
            return this.__SuperiorEnlistmentPair
        }
    }
}
