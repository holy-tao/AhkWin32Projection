#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ID of cost policies options associated with the **DODownloadProperty_CostPolicy** property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/deliveryoptimization/ne-deliveryoptimization-dodownloadcostpolicy
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DODownloadCostPolicy extends Win32Enum{

    /**
     * Download runs regardless of the cost.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_Always => 0

    /**
     * Download runs unless imposes costs or traffic limits.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_Unrestricted => 1

    /**
     * Download runs unless neither subject to a surcharge nor near exhaustion.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_Standard => 2

    /**
     * Download runs unless that connectivity is subject to roaming surcharges.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_NoRoaming => 3

    /**
     * Download runs unless subject to a surcharge.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_NoSurcharge => 4

    /**
     * Download runs unless network is on cellular.
     * @type {Integer (Int32)}
     */
    static DODownloadCostPolicy_NoCellular => 5
}
