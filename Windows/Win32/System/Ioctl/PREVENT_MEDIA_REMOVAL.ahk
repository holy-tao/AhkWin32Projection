#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Provides removable media locking data. It is used by the IOCTL_STORAGE_MEDIA_REMOVAL control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-prevent_media_removal
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PREVENT_MEDIA_REMOVAL {
    #StructPack 1

    /**
     * If this member is <b>TRUE</b>, the media is to be locked. Otherwise, it is not.
     */
    PreventMediaRemoval : BOOLEAN

}
