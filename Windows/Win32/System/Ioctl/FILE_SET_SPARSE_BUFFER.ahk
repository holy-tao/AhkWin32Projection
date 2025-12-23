#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the sparse state to be set.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_set_sparse_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_SET_SPARSE_BUFFER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * If <b>TRUE</b>, makes the file sparse.
     * 
     * If <b>FALSE</b>, makes the file not sparse.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008 and Windows Vista:  </b>A value of <b>FALSE</b> for this member is valid only on files that no longer have any 
     *         sparse regions. For more information, see 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_set_sparse">FSCTL_SET_SPARSE</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>A value of <b>FALSE</b> for this member is not supported. Specifying 
     *         <b>FALSE</b> will cause the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_set_sparse">FSCTL_SET_SPARSE</a> call to fail.
     * @type {BOOLEAN}
     */
    SetSparse {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
