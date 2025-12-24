#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KEY_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KeyBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeyNodeInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeyFullInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static KeyNameInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static KeyCachedInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static KeyFlagsInformation => 5

    /**
     * @type {Integer (Int32)}
     */
    static KeyVirtualizationInformation => 6

    /**
     * @type {Integer (Int32)}
     */
    static KeyHandleTagsInformation => 7

    /**
     * @type {Integer (Int32)}
     */
    static KeyTrustInformation => 8

    /**
     * @type {Integer (Int32)}
     */
    static KeyLayerInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyInfoClass => 10
}
