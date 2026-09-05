#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class KSPROPERTY_IPSINK extends Win32BitflagEnum {

    /**
     * Native name: KSPROPERTY_IPSINK_MULTICASTLIST
     * @type {Integer (Int32)}
     */
    static MULTICASTLIST => 0

    /**
     * Native name: KSPROPERTY_IPSINK_ADAPTER_DESCRIPTION
     * @type {Integer (Int32)}
     */
    static ADAPTER_DESCRIPTION => 1

    /**
     * Native name: KSPROPERTY_IPSINK_ADAPTER_ADDRESS
     * @type {Integer (Int32)}
     */
    static ADAPTER_ADDRESS => 2
}
