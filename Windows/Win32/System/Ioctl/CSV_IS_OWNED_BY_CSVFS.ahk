#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains the output for the FSCTL_IS_VOLUME_OWNED_BYCSVFS control code that determines whether a volume is owned by CSVFS.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_is_owned_by_csvfs
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_IS_OWNED_BY_CSVFS {
    #StructPack 1

    /**
     * <b>TRUE</b> if a volume is owned by CSVFS; otherwise, 
     *       <b>FALSE</b>.
     */
    OwnedByCSVFS : BOOLEAN

}
