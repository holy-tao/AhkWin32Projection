#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class TELEPHONY_PROVIDERCHANGEOP extends Win32Enum {

    /**
     * Native name: TELEPHONY_PROVIDERCHANGEOP_END
     * @type {Integer (Int32)}
     */
    static END => 0

    /**
     * Native name: TELEPHONY_PROVIDERCHANGEOP_BEGIN
     * @type {Integer (Int32)}
     */
    static BEGIN => 1

    /**
     * Native name: TELEPHONY_PROVIDERCHANGEOP_CANCEL
     * @type {Integer (Int32)}
     */
    static CANCEL => 2
}
