#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class MEMORY_CACHING_TYPE_ORIG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MmFrameBufferCached => 2
}
