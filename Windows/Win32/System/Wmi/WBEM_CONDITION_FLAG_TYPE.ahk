#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags used with the IWbemClassObject::GetNames method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_condition_flag_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_CONDITION_FLAG_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ALWAYS => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ONLY_IF_TRUE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ONLY_IF_FALSE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_ONLY_IF_IDENTICAL => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MASK_PRIMARY_CONDITION => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_KEYS_ONLY => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_REFS_ONLY => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_LOCAL_ONLY => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_PROPAGATED_ONLY => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_SYSTEM_ONLY => 48

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_NONSYSTEM_ONLY => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MASK_CONDITION_ORIGIN => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CLASS_OVERRIDES_ONLY => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CLASS_LOCAL_AND_OVERRIDES => 512

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WBEM_MASK_CLASS_CONDITION => 768
}
