#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes the properties of an annotation in a document.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iannotationprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAnnotationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnnotationProvider
     * @type {Guid}
     */
    static IID => Guid("{f95c7e80-bd63-4601-9782-445ebff011fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnnotationTypeId", "get_AnnotationTypeName", "get_Author", "get_DateTime", "get_Target"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypeid
     */
    get_AnnotationTypeId(retVal) {
        result := ComCall(3, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypename
     */
    get_AnnotationTypeName(retVal) {
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_author
     */
    get_Author(retVal) {
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_datetime
     */
    get_DateTime(retVal) {
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_target
     */
    get_Target(retVal) {
        result := ComCall(7, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
