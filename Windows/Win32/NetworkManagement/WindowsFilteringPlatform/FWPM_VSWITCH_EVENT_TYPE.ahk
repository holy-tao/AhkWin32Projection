#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a vSwitch event.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_vswitch_event_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_VSWITCH_EVENT_TYPE{

    /**
     * The filter engine is not enabled on all vSwitch instances. As a result, the filter(s) being added may not be fully enforced.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_FILTER_ADD_TO_INCOMPLETE_LAYER => 0

    /**
     * The filter engine to which the filter(s) are being added is not in its required position (typically the first filtering extension in the vSwitch instance). As a result, the filter(s) could be bypassed.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_FILTER_ENGINE_NOT_IN_REQUIRED_POSITION => 1

    /**
     * The filter engine is being enabled for the vSwitch instance.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_ENABLED_FOR_INSPECTION => 2

    /**
     * The filter engine is being disabled for the vSwitch instance.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_DISABLED_FOR_INSPECTION => 3

    /**
     * The filter engine is being reordered and may not be in the
 *    required position to enforce committed filters.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_FILTER_ENGINE_REORDER => 4

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_VSWITCH_EVENT_MAX => 5
}
