#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags used with the IWbemClassObject::GetNames method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_condition_flag_type
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_CONDITION_FLAG_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_ALWAYS
     * @type {Integer (Int32)}
     */
    static ALWAYS => 0

    /**
     * Native name: WBEM_FLAG_ONLY_IF_TRUE
     * @type {Integer (Int32)}
     */
    static ONLY_IF_TRUE => 1

    /**
     * Native name: WBEM_FLAG_ONLY_IF_FALSE
     * @type {Integer (Int32)}
     */
    static ONLY_IF_FALSE => 2

    /**
     * Native name: WBEM_FLAG_ONLY_IF_IDENTICAL
     * @type {Integer (Int32)}
     */
    static ONLY_IF_IDENTICAL => 3

    /**
     * Native name: WBEM_MASK_PRIMARY_CONDITION
     * @type {Integer (Int32)}
     */
    static MASK_PRIMARY_CONDITION => 3

    /**
     * Native name: WBEM_FLAG_KEYS_ONLY
     * @type {Integer (Int32)}
     */
    static KEYS_ONLY => 4

    /**
     * Native name: WBEM_FLAG_REFS_ONLY
     * @type {Integer (Int32)}
     */
    static REFS_ONLY => 8

    /**
     * Native name: WBEM_FLAG_LOCAL_ONLY
     * @type {Integer (Int32)}
     */
    static LOCAL_ONLY => 16

    /**
     * Native name: WBEM_FLAG_PROPAGATED_ONLY
     * @type {Integer (Int32)}
     */
    static PROPAGATED_ONLY => 32

    /**
     * Native name: WBEM_FLAG_SYSTEM_ONLY
     * @type {Integer (Int32)}
     */
    static SYSTEM_ONLY => 48

    /**
     * Native name: WBEM_FLAG_NONSYSTEM_ONLY
     * @type {Integer (Int32)}
     */
    static NONSYSTEM_ONLY => 64

    /**
     * Native name: WBEM_MASK_CONDITION_ORIGIN
     * @type {Integer (Int32)}
     */
    static MASK_CONDITION_ORIGIN => 112

    /**
     * Native name: WBEM_FLAG_CLASS_OVERRIDES_ONLY
     * @type {Integer (Int32)}
     */
    static CLASS_OVERRIDES_ONLY => 256

    /**
     * Native name: WBEM_FLAG_CLASS_LOCAL_AND_OVERRIDES
     * @type {Integer (Int32)}
     */
    static CLASS_LOCAL_AND_OVERRIDES => 512

    /**
     * Native name: WBEM_MASK_CLASS_CONDITION
     * @type {Integer (Int32)}
     */
    static MASK_CLASS_CONDITION => 768
}
