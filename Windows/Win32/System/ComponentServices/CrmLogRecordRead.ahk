#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\BLOB.ahk" { BLOB }

/**
 * Contains unstructured log records for the Compensating Resource Manager (CRM).
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-crmlogrecordread
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CrmLogRecordRead {
    #StructPack 8

    /**
     * Information about when this record was written. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-crmflags">CRMFLAGS</a>.
     */
    dwCrmFlags : UInt32

    /**
     * The sequence number of the log record. Sequence numbers are not necessarily contiguous because not all internal log records or forgotten log records are delivered to the CRM Compensator.
     */
    dwSequenceNumber : UInt32

    /**
     * The user data.
     */
    blobUserData : BLOB

}
