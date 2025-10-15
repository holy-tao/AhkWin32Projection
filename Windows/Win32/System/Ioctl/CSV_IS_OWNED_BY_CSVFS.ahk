#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Contains the output for the FSCTL_IS_VOLUME_OWNED_BYCSVFS control code that determines whether a volume is owned by CSVFS.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-csv_is_owned_by_csvfs
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_IS_OWNED_BY_CSVFS extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * <b>TRUE</b> if a volume is owned by CSVFS; otherwise, 
     *       <b>FALSE</b>.
     * @type {BOOLEAN}
     */
    OwnedByCSVFS{
        get {
            if(!this.HasProp("__OwnedByCSVFS"))
                this.__OwnedByCSVFS := BOOLEAN(this.ptr + 0)
            return this.__OwnedByCSVFS
        }
    }
}
