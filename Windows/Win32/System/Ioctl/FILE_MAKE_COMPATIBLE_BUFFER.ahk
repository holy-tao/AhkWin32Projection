#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Specifies the disc to close the current session for. This control code is used for UDF file systems. This structure is used for input when calling FSCTL_MAKE_MEDIA_COMPATIBLE.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-file_make_compatible_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_MAKE_COMPATIBLE_BUFFER {
    #StructPack 1

    /**
     * If <b>TRUE</b>, indicates the media should be finalized. No new data can be appended to the media.
     */
    CloseDisc : BOOLEAN

}
