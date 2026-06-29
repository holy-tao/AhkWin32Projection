#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/ne-subscriptionservices-wmpsubscriptionserviceevent
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPSubscriptionServiceEvent {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The online store is active.
     * @type {Integer (Int32)}
     */
    static wmpsseCurrentBegin => 1

    /**
     * The online store is no longer active.
     * @type {Integer (Int32)}
     */
    static wmpsseCurrentEnd => 2

    /**
     * The online store is the current active music store.
     * @type {Integer (Int32)}
     */
    static wmpsseFullBegin => 3

    /**
     * The online store is no longer the current active music store.
     * @type {Integer (Int32)}
     */
    static wmpsseFullEnd => 4
}
