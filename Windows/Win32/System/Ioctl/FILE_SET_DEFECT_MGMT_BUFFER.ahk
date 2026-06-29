#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Specifies the defect management state to be set.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_set_defect_mgmt_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_SET_DEFECT_MGMT_BUFFER {
    #StructPack 1

    /**
     * If <b>TRUE</b>, indicates that defect management is disabled.
     */
    Disable : BOOLEAN

}
