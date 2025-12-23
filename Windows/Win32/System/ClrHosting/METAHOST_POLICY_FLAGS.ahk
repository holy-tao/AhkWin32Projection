#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class METAHOST_POLICY_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_HIGHCOMPAT => 0

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_APPLY_UPGRADE_POLICY => 8

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_EMULATE_EXE_LAUNCH => 16

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_SHOW_ERROR_DIALOG => 32

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_USE_PROCESS_IMAGE_PATH => 64

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_ENSURE_SKU_SUPPORTED => 128

    /**
     * @type {Integer (Int32)}
     */
    static METAHOST_POLICY_IGNORE_ERROR_MODE => 4096
}
