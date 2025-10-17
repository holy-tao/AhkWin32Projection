#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Com\BLOB.ahk

/**
 * Contains unstructured log records for the Compensating Resource Manager (CRM).
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ns-comsvcs-crmlogrecordread
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CrmLogRecordRead extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Information about when this record was written. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-crmflags">CRMFLAGS</a>.
     * @type {Integer}
     */
    dwCrmFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The sequence number of the log record. Sequence numbers are not necessarily contiguous because not all internal log records or forgotten log records are delivered to the CRM Compensator.
     * @type {Integer}
     */
    dwSequenceNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The user data.
     * @type {BLOB}
     */
    blobUserData{
        get {
            if(!this.HasProp("__blobUserData"))
                this.__blobUserData := BLOB(8, this)
            return this.__blobUserData
        }
    }
}
