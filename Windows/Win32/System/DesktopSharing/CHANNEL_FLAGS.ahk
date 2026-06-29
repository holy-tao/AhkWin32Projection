#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values for how data is sent on the channel.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-channel_flags
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct CHANNEL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_LEGACY => 1

    /**
     * Data sent on the channel is not compressed. Use this option if the data is already compressed.
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_UNCOMPRESSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHANNEL_FLAGS_DYNAMIC => 4
}
