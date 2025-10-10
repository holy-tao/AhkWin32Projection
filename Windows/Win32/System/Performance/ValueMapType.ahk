#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of the value.
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-valuemaptype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ValueMapType{

    /**
     * Only one item in the collection can be enabled. The enabled item is the value of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a> property. If more than one item is enabled, the first enabled item is used as the value.
     * @type {Integer (Int32)}
     */
    static plaIndex => 1

    /**
     * One or more items in the collection can be enabled. An item in the collection represents a single bit flag. The enabled items in the collection are combined  with the <b>OR</b> operator to become the value of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-ivaluemap-get_value">IValueMap::Value</a>.
     * @type {Integer (Int32)}
     */
    static plaFlag => 2

    /**
     * The collection contains a list of Event Tracing for Windows extended flags (see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-itracedataprovider-get_properties">ITraceDataProvider::Properties</a> property).
     * @type {Integer (Int32)}
     */
    static plaFlagArray => 3

    /**
     * The collection contains a list of HRESULT values returned by the validation process.
     * @type {Integer (Int32)}
     */
    static plaValidation => 4
}
