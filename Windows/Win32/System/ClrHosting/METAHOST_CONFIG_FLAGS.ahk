#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class METAHOST_CONFIG_FLAGS extends Win32Enum {

    /**
     * Native name: METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_UNSET
     * @type {Integer (Int32)}
     */
    static LEGACY_V2_ACTIVATION_POLICY_UNSET => 0

    /**
     * Native name: METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_TRUE
     * @type {Integer (Int32)}
     */
    static LEGACY_V2_ACTIVATION_POLICY_TRUE => 1

    /**
     * Native name: METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_FALSE
     * @type {Integer (Int32)}
     */
    static LEGACY_V2_ACTIVATION_POLICY_FALSE => 2

    /**
     * Native name: METAHOST_CONFIG_FLAGS_LEGACY_V2_ACTIVATION_POLICY_MASK
     * @type {Integer (Int32)}
     */
    static LEGACY_V2_ACTIVATION_POLICY_MASK => 3
}
