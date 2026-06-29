#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\BYTE_BLOB.ahk" { BYTE_BLOB }

/**
 * Describes conflict ID information structure.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_CONFLICT_ID_INFO {
    #StructPack 8

    /**
     * Type: <b>BYTE_BLOB*</b>
     * 
     * A pointer to a blob used for comparison.
     */
    pblobID : BYTE_BLOB.Ptr

    /**
     * Type: <b>BYTE_BLOB*</b>
     * 
     * A pointer to extra data used to initialize conflict objects.
     */
    pblobExtra : BYTE_BLOB.Ptr

}
