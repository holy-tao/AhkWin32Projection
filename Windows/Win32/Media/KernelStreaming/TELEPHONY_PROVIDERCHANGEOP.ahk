#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class TELEPHONY_PROVIDERCHANGEOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_PROVIDERCHANGEOP_END => 0

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_PROVIDERCHANGEOP_BEGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_PROVIDERCHANGEOP_CANCEL => 2
}
