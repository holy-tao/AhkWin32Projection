#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MENUINFO_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_AUTODISMISS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_CHECKORBMP => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_DRAGDROP => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_MODELESS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_NOCHECK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_NOTIFYBYPOS => 134217728
}
