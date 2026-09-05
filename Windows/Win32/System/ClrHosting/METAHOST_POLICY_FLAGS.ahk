#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class METAHOST_POLICY_FLAGS extends Win32Enum {

    /**
     * Native name: METAHOST_POLICY_HIGHCOMPAT
     * @type {Integer (Int32)}
     */
    static HIGHCOMPAT => 0

    /**
     * Native name: METAHOST_POLICY_APPLY_UPGRADE_POLICY
     * @type {Integer (Int32)}
     */
    static APPLY_UPGRADE_POLICY => 8

    /**
     * Native name: METAHOST_POLICY_EMULATE_EXE_LAUNCH
     * @type {Integer (Int32)}
     */
    static EMULATE_EXE_LAUNCH => 16

    /**
     * Native name: METAHOST_POLICY_SHOW_ERROR_DIALOG
     * @type {Integer (Int32)}
     */
    static SHOW_ERROR_DIALOG => 32

    /**
     * Native name: METAHOST_POLICY_USE_PROCESS_IMAGE_PATH
     * @type {Integer (Int32)}
     */
    static USE_PROCESS_IMAGE_PATH => 64

    /**
     * Native name: METAHOST_POLICY_ENSURE_SKU_SUPPORTED
     * @type {Integer (Int32)}
     */
    static ENSURE_SKU_SUPPORTED => 128

    /**
     * Native name: METAHOST_POLICY_IGNORE_ERROR_MODE
     * @type {Integer (Int32)}
     */
    static IGNORE_ERROR_MODE => 4096
}
