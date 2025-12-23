#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains general-purpose method parameter flags.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_generic_flag_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_GENERIC_FLAG_TYPE extends Win32BitflagEnum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_RETURN_IMMEDIATELY => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_RETURN_WBEM_COMPLETE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_BIDIRECTIONAL => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_FORWARD_ONLY => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_NO_ERROR_OBJECT => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_RETURN_ERROR_OBJECT => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_SEND_STATUS => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_DONT_SEND_STATUS => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ENSURE_LOCATABLE => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_DIRECT_READ => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_SEND_ONLY_SELECTED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_RETURN_WHEN_COMPLETE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_RETURN_IMMEDIATELY => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MASK_RESERVED_FLAGS => 126976

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_USE_AMENDED_QUALIFIERS => 131072

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_STRONG_VALIDATION => 1048576
}
