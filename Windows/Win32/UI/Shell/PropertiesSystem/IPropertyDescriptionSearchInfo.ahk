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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getsearchinfoflags
     */
    GetSearchInfoFlags() {
        result := ComCall(24, this, "int*", &ppdsiFlags := 0, "HRESULT")
        return ppdsiFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getcolumnindextype
     */
    GetColumnIndexType() {
        result := ComCall(25, this, "int*", &ppdciType := 0, "HRESULT")
        return ppdciType
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getprojectionstring
     */
    GetProjectionString() {
        result := ComCall(26, this, "ptr*", &ppszProjection := 0, "HRESULT")
        return ppszProjection
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertydescriptionsearchinfo-getmaxsize
     */
    GetMaxSize() {
        result := ComCall(27, this, "uint*", &pcbMaxSize := 0, "HRESULT")
        return pcbMaxSize
    }
}
