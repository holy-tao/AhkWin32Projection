#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADMIN_OTHER_INFO structure contains error message information. The NetAlertRaise and NetAlertRaiseEx functions use the ADMIN_OTHER_INFO structure to specify information when raising an administrator's interrupting message.
 * @remarks
 * Variable-length data follows the 
  * <b>ADMIN_OTHER_INFO</b> structure in the alert message buffer if you specify one or more strings in the <b>alrtad_numstrings</b> member. The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
  * 
  * See 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraise">NetAlertRaise</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/lmalert/nf-lmalert-netalertraiseex">NetAlertRaiseEx</a> for code samples that demonstrate how to raise an administrative alert.
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/ns-lmalert-admin_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class ADMIN_OTHER_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the error code for the new message written to the message log.
     * @type {Integer}
     */
    alrtad_errcode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number (0-9) of consecutive Unicode strings written to the message log.
     * @type {Integer}
     */
    alrtad_numstrings {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
