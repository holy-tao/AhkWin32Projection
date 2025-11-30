#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://docs.microsoft.com/windows/win32/api//subscriptionservices/ne-subscriptionservices-wmpsubscriptionserviceevent
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPSubscriptionServiceEvent extends Win32Enum{

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
