#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for the priority used to send packets on the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_priority
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct CHANNEL_PRIORITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Send the packets at a low priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_LO => 0

    /**
     * Send the packets at a medium priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_MED => 1

    /**
     * Send the packets at a high priority.
     * @type {Integer (Int32)}
     */
    static CHANNEL_PRIORITY_HI => 2
}
