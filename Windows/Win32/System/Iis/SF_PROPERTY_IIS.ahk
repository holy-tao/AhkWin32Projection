#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class SF_PROPERTY_IIS extends Win32Enum {

    /**
     * Native name: SF_PROPERTY_SSL_CTXT
     * @type {Integer (Int32)}
     */
    static SSL_CTXT => 0

    /**
     * Native name: SF_PROPERTY_INSTANCE_NUM_ID
     * @type {Integer (Int32)}
     */
    static INSTANCE_NUM_ID => 1
}
