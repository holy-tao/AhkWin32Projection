#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_INTERRUPT_MODERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationNotSupported => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisInterruptModerationDisabled => 3
}
