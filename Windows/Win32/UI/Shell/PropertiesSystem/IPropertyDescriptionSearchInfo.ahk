#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IPropertyDescription.ahk

/**
 * Exposes search-related information for a property.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertydescriptionsearchinfo
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyDescriptionSearchInfo extends IPropertyDescription{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyDescriptionSearchInfo
     * @type {Guid}
     */
    static IID => Guid("{078f91bd-29a2-440f-924e-46a291524520}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSearchInfoFlags", "GetColumnIndexType", "GetProjectionString", "GetMaxSize"]

    /**
     * Gets the PROPDESC_SEARCHINFO_FLAGS associated with the property.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_searchinfo_flags">PROPDESC_SEARCHINFO_FLAGS</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_searchinfo_flags">PROPDESC_SEARCHINFO_FLAGS</a> associated with the property.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionsearchinfo-getsearchinfoflags
     */
    GetSearchInfoFlags() {
        result := ComCall(24, this, "int*", &ppdsiFlags := 0, "HRESULT")
        return ppdsiFlags
    }

    /**
     * Determines the how the current property is indexed.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_columnindex_type">PROPDESC_COLUMNINDEX_TYPE</a>*</b>
     * 
     * When this method returns successfully, contains a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_columnindex_type">PROPDESC_COLUMNINDEX_TYPE</a> constant. This constant describes whether the property is indexed and if so, if it is indexed in memory or on disk.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionsearchinfo-getcolumnindextype
     */
    GetColumnIndexType() {
        result := ComCall(25, this, "int*", &ppdciType := 0, "HRESULT")
        return ppdciType
    }

    /**
     * Returns a pointer to a string containing the canonical name of the item.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns successfully, contains a pointer to a string containing the canonical name of the item.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionsearchinfo-getprojectionstring
     */
    GetProjectionString() {
        result := ComCall(26, this, "ptr*", &ppszProjection := 0, "HRESULT")
        return ppszProjection
    }

    /**
     * Gets the maximum size value from the property schema's searchInfo element.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the value of the maxSize attribute of the <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-searchinfo">searchInfo</a> element. The default is:
     * 
     *                     
     * 
     * <ul>
     * <li><b>Windows Vista</b>: 128 bytes</li>
     * <li><b>Windows 7 and later</b>: 512 bytes</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertydescriptionsearchinfo-getmaxsize
     */
    GetMaxSize() {
        result := ComCall(27, this, "uint*", &pcbMaxSize := 0, "HRESULT")
        return pcbMaxSize
    }
}
