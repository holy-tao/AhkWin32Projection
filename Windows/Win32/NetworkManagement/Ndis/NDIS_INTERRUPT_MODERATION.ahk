#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_INTERRUPT_MODERATION extends Win32Enum {

    /**
     * Native name: NdisInterruptModerationUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: NdisInterruptModerationNotSupported
     * @type {Integer (Int32)}
     */
    static NotSupported => 1

    /**
     * Native name: NdisInterruptModerationEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 2

    /**
     * Native name: NdisInterruptModerationDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 3
}
