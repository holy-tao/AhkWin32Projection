#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class SF_PROPERTY_IIS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SF_PROPERTY_SSL_CTXT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SF_PROPERTY_INSTANCE_NUM_ID => 1
}
