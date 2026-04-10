#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class LINK_TRACKING_INFORMATION_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NtfsLinkTrackingInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static DfsLinkTrackingInformation => 1
}
