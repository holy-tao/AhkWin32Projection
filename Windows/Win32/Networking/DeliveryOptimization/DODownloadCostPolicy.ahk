#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ID of cost policies options associated with the **DODownloadProperty_CostPolicy** property.
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadcostpolicy
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 */
class DODownloadCostPolicy extends Win32Enum {

    /**
     * Download runs regardless of the cost.
     * Native name: DODownloadCostPolicy_Always
     * @type {Integer (Int32)}
     */
    static Always => 0

    /**
     * Download runs unless imposes costs or traffic limits.
     * Native name: DODownloadCostPolicy_Unrestricted
     * @type {Integer (Int32)}
     */
    static Unrestricted => 1

    /**
     * Download runs unless neither subject to a surcharge nor near exhaustion.
     * Native name: DODownloadCostPolicy_Standard
     * @type {Integer (Int32)}
     */
    static Standard => 2

    /**
     * Download runs unless that connectivity is subject to roaming surcharges.
     * Native name: DODownloadCostPolicy_NoRoaming
     * @type {Integer (Int32)}
     */
    static NoRoaming => 3

    /**
     * Download runs unless subject to a surcharge.
     * Native name: DODownloadCostPolicy_NoSurcharge
     * @type {Integer (Int32)}
     */
    static NoSurcharge => 4

    /**
     * Download runs unless network is on cellular.
     * Native name: DODownloadCostPolicy_NoCellular
     * @type {Integer (Int32)}
     */
    static NoCellular => 5
}
