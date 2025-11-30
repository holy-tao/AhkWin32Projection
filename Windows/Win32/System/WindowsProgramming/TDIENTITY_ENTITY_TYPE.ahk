#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class TDIENTITY_ENTITY_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GENERIC_ENTITY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static AT_ENTITY => 640

    /**
     * @type {Integer (UInt32)}
     */
    static CL_NL_ENTITY => 769

    /**
     * @type {Integer (UInt32)}
     */
    static CO_NL_ENTITY => 768

    /**
     * @type {Integer (UInt32)}
     */
    static CL_TL_ENTITY => 1025

    /**
     * @type {Integer (UInt32)}
     */
    static CO_TL_ENTITY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ER_ENTITY => 896

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENTITY => 512
}
