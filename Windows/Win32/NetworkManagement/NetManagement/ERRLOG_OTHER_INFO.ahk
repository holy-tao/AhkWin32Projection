#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ERRLOG_OTHER_INFO structure contains error log information. The NetAlertRaise and NetAlertRaiseEx functions use the ERRLOG_OTHER_INFO structure to specify information when adding a new entry to the error log.
 * @remarks
 * 
  * The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmalert/ns-lmalert-errlog_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class ERRLOG_OTHER_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the error code that was written to the error log.
     * @type {Integer}
     */
    alrter_errcode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the offset for the new entry in the error log.
     * @type {Integer}
     */
    alrter_offset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
