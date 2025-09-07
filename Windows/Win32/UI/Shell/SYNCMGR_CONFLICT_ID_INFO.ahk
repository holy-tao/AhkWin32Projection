#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes conflict ID information structure.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_CONFLICT_ID_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>BYTE_BLOB*</b>
     * 
     * A pointer to a blob used for comparison.
     * @type {Pointer<BYTE_BLOB>}
     */
    pblobID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>BYTE_BLOB*</b>
     * 
     * A pointer to extra data used to initialize conflict objects.
     * @type {Pointer<BYTE_BLOB>}
     */
    pblobExtra {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
