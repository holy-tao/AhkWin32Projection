#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the type of access granted to the attendee for the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_access_enum
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct CHANNEL_ACCESS_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No access. The attendee cannot send or receive data on the channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACCESS_ENUM_NONE => 0

    /**
     * The attendee can send or receive data on the channel.
     * @type {Integer (Int32)}
     */
    static CHANNEL_ACCESS_ENUM_SENDRECEIVE => 1
}
