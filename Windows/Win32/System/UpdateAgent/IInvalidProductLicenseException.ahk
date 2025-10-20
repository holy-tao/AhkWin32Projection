#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateException.ahk

/**
 * Encapsulates the exception that is thrown when an invalid license is detected for a product.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iinvalidproductlicenseexception
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IInvalidProductLicenseException extends IUpdateException{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInvalidProductLicenseException
     * @type {Guid}
     */
    static IID => Guid("{a37d00f5-7bb0-4953-b414-f9e98326f2e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Product"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iinvalidproductlicenseexception-get_product
     */
    get_Product(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }
}
