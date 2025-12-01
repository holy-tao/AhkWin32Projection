#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MMC_FILTER_CHANGE_CODE enumeration is introduced in MMC 1.2.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_filter_change_code
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_FILTER_CHANGE_CODE extends Win32Enum{

    /**
     * The filter view has been turned off.
     * @type {Integer (Int32)}
     */
    static MFCC_DISABLE => 0

    /**
     * The filter view has been turned on.
     * @type {Integer (Int32)}
     */
    static MFCC_ENABLE => 1

    /**
     * The filter value of a column in a result view filter list has changed. The <i>param</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-notify">IComponent::Notify</a> method contains the column ID.
     * @type {Integer (Int32)}
     */
    static MFCC_VALUE_CHANGE => 2
}
