#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ResultCodes.ahk

/**
 * Contains fix-up information for the Sysytem Health Agent (SHA).
 * @remarks
 * 
 * If your SHA remediation process supports the reporting of percentage values during update, <b>percentage</b> is used to communicate the current progress as an integer percentage value. When the remediation update is complete, <b>percentage</b> must be set to 100, and <b>state</b> must be set to <b>fixupStateSuccess</b>. If remediation is not complete, <b>percentage</b> must be set to a value between 0 and 99, inclusive, and <b>state</b> must be set to <b>fixupStateInProgress</b>.
 * 
 * If your remediation process does not support the reporting of percentage values, then as long as <b>state</b> is set to <b>fixupStateInProgress</b>, <b>percentage</b> must be set to a value of 101, which indicates the remediation process is in a general "updating" state but the amount of completion is unknown. When remediation completes, <b>state</b> must be set to <b>fixupStateSuccess</b> and <b>percentage</b> must be set to 100.
 * 
 * If the SHA cannot update the fix-up information, then <b>state</b> must be set to <b>fixupStateCouldNotUpdate</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//naptypes/ns-naptypes-fixupinfo
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 * @version v4.0.30319
 */
class FixupInfo extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-fixupstate">FixupState</a> value that defines the fix-up state of the SHA.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">Percentage</a> data type that contains the percentage of remediation that is complete. This member is a nonzero value between 0 (zero) and 100 when <b>state</b> is equal to <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-fixupstate">FixupStateInProgress</a>; otherwise, it is 0 (zero).
     * 
     * <div class="alert"><b>Note</b>  If the SHA does not support percentages, this value is either 0, which indicates the SHA update has not started; or 101, which indicates the SHA is in the process of updating.</div>
     * <div> </div>
     * @type {Integer}
     */
    percentage {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ns-naptypes-resultcodes">ResultCodes</a> structure that contains the SHA defined HRESULT values returned to the NAP Agent in a call to <a href="https://docs.microsoft.com/windows/desktop/NAP/inapsystemhealthagentcallback-getfixupinfo-method">GetFixupInfo</a>.
     * @type {ResultCodes}
     */
    resultCodes{
        get {
            if(!this.HasProp("__resultCodes"))
                this.__resultCodes := ResultCodes(8, this)
            return this.__resultCodes
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-datatypes">MessageID</a> value that contains the SHA defined resource ID of a fix-up status structure.
     * @type {Integer}
     */
    fixupMsgId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
