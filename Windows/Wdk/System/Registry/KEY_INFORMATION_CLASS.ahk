#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.Registry
 */
class KEY_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: KeyBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: KeyNodeInformation
     * @type {Integer (Int32)}
     */
    static NodeInformation => 1

    /**
     * Native name: KeyFullInformation
     * @type {Integer (Int32)}
     */
    static FullInformation => 2

    /**
     * Native name: KeyNameInformation
     * @type {Integer (Int32)}
     */
    static NameInformation => 3

    /**
     * Native name: KeyCachedInformation
     * @type {Integer (Int32)}
     */
    static CachedInformation => 4

    /**
     * Native name: KeyFlagsInformation
     * @type {Integer (Int32)}
     */
    static FlagsInformation => 5

    /**
     * Native name: KeyVirtualizationInformation
     * @type {Integer (Int32)}
     */
    static VirtualizationInformation => 6

    /**
     * Native name: KeyHandleTagsInformation
     * @type {Integer (Int32)}
     */
    static HandleTagsInformation => 7

    /**
     * Native name: KeyTrustInformation
     * @type {Integer (Int32)}
     */
    static TrustInformation => 8

    /**
     * Native name: KeyLayerInformation
     * @type {Integer (Int32)}
     */
    static LayerInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static MaxKeyInfoClass => 10
}
