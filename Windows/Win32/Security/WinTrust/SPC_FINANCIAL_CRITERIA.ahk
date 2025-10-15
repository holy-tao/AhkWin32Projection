#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_FINANCIAL_CRITERIA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fFinancialInfoAvailable{
        get {
            if(!this.HasProp("__fFinancialInfoAvailable"))
                this.__fFinancialInfoAvailable := BOOL(this.ptr + 0)
            return this.__fFinancialInfoAvailable
        }
    }

    /**
     * @type {BOOL}
     */
    fMeetsCriteria{
        get {
            if(!this.HasProp("__fMeetsCriteria"))
                this.__fMeetsCriteria := BOOL(this.ptr + 4)
            return this.__fMeetsCriteria
        }
    }
}
