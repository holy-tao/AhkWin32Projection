#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether the caller should use the IPropertySetStorage and IPropertyStorage interfaces to locate additional properties.
 * @remarks
 * The <i>pdwFlags</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-init">IFilter::Init</a> method allows the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> implementation to pass information back to the caller. For Indexing Service 3.0, the only valid flag is IFILTER_FLAGS_OLE_PROPERTIES. If OLE properties should not be enumerated, then pdwFlags should be set to zero.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ne-filter-ifilter_flags
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IFILTER_FLAGS{

    /**
     * The caller should use the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertysetstorage">IPropertySetStorage</a> and <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interfaces to locate additional properties. When this flag is set, properties available through COM enumerators should not be returned from <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a>.
     * @type {Integer (Int32)}
     */
    static IFILTER_FLAGS_OLE_PROPERTIES => 1
}
