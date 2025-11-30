#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_ASPM_CONTROL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static L0sAndL1EntryDisabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static L0sEntryEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static L1EntryEnabled => 2

    /**
     * @type {Integer (Int32)}
     */
    static L0sAndL1EntryEnabled => 3
}
