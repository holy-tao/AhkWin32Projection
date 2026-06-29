#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to specify the type of graphics virtual channel to create in the IWRdsGraphicsChannelManager::CreateChannel method.
 * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRdsGraphicsChannelType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The channel delivery must be guaranteed.
     * @type {Integer (Int32)}
     */
    static WRdsGraphicsChannelType_GuaranteedDelivery => 0

    /**
     * The channel delivery can be lossy.
     * @type {Integer (Int32)}
     */
    static WRdsGraphicsChannelType_BestEffortDelivery => 1
}
