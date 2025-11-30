#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPAccountType enumeration defines account types for an online store.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/ne-contentpartner-wmpaccounttype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPAccountType extends Win32Enum{

    /**
     * The user is only authorized to purchase content.
     * @type {Integer (Int32)}
     */
    static wmpatBuyOnly => 1

    /**
     * The user has a subscription account, but content must be purchased to synchronize to a device based on Windows Media DRM for Portable Devices.
     * @type {Integer (Int32)}
     */
    static wmpatSubscription => 2

    /**
     * The user has a subscription account and the subscription content can be synchronized to a device based on Windows Media DRM for Portable Devices.
     * @type {Integer (Int32)}
     */
    static wmpatJanus => 3
}
