#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify the type of graphics virtual channel to create in the IWRdsGraphicsChannelManager::CreateChannel method.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/ne-wrdsgraphicschannels-wrdsgraphicschanneltype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRdsGraphicsChannelType extends Win32Enum{

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
