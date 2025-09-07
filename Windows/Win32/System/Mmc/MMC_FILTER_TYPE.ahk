#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MMC_FILTER_TYPE enumeration is introduced in MMC 1.2.
 * @remarks
 * The <b>MMC_FILTER_NOVALUE</b> enumerator value is not a filter type, but a flag that can be OR'd with a filter type. For example, to set a string type filter with no default value, you set the filter type to the following: <c>MMC_STRING_FILTER | MMC_FILTER_NOVALUE</c>.
  * 
  * When reading filter data, if no value has been entered by the snap-in or the user, the return type will be the filter type OR'd with <b>MMC_FILTER_NOVALUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ne-mmc-mmc_filter_type
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_FILTER_TYPE{

    /**
     * String filter.
     * @type {Integer (Int32)}
     */
    static MMC_STRING_FILTER => 0

    /**
     * Integer filter.
     * @type {Integer (Int32)}
     */
    static MMC_INT_FILTER => 1

    /**
     * When used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iheaderctrl2-setcolumnfilter">IHeaderCtrl2::SetColumnFilter</a> method, the snap-in sets the flag to clear the column filter.
 * 
 * When used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iheaderctrl2-getcolumnfilter">IHeaderCtrl2::GetColumnFilter</a> method, the flag is set to indicate that the column filter is empty.
     * @type {Integer (Int32)}
     */
    static MMC_FILTER_NOVALUE => 32768
}
