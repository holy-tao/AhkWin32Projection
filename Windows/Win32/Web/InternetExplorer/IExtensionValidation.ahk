#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IExtensionValidation extends IUnknown{
    /**
     * The interface identifier for IExtensionValidation
     * @type {Guid}
     */
    static IID => Guid("{7d33f73d-8525-4e0f-87db-830288baff44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} extensionGuid 
     * @param {PWSTR} extensionModulePath 
     * @param {Integer} extensionFileVersionMS 
     * @param {Integer} extensionFileVersionLS 
     * @param {Pointer<IHTMLDocument2>} htmlDocumentTop 
     * @param {Pointer<IHTMLDocument2>} htmlDocumentSubframe 
     * @param {Pointer<IHTMLElement>} htmlElement 
     * @param {Integer} contexts 
     * @param {Pointer<Int32>} results 
     * @returns {HRESULT} 
     */
    Validate(extensionGuid, extensionModulePath, extensionFileVersionMS, extensionFileVersionLS, htmlDocumentTop, htmlDocumentSubframe, htmlElement, contexts, results) {
        extensionModulePath := extensionModulePath is String ? StrPtr(extensionModulePath) : extensionModulePath

        result := ComCall(3, this, "ptr", extensionGuid, "ptr", extensionModulePath, "uint", extensionFileVersionMS, "uint", extensionFileVersionLS, "ptr", htmlDocumentTop, "ptr", htmlDocumentSubframe, "ptr", htmlElement, "int", contexts, "int*", results, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} displayName 
     * @returns {HRESULT} 
     */
    DisplayName(displayName) {
        result := ComCall(4, this, "ptr", displayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
