#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information associated with a media change event.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-class_media_change_context
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CLASS_MEDIA_CHANGE_CONTEXT {
    #StructPack 4

    /**
     * The number of times that media has been changed since system startup.
     */
    MediaChangeCount : UInt32

    NewState : UInt32

}
