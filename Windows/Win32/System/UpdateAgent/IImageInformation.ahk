#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about a localized image that is associated with an update or a category.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iimageinformation
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IImageInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageInformation
     * @type {Guid}
     */
    static IID => Guid("{7c907864-346c-4aeb-8f3f-57da289f969f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AltText", "get_Height", "get_Source", "get_Width"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_alttext
     */
    get_AltText(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_height
     */
    get_Height(retval) {
        result := ComCall(8, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_source
     */
    get_Source(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iimageinformation-get_width
     */
    get_Width(retval) {
        result := ComCall(10, this, "int*", retval, "HRESULT")
        return result
    }
}
