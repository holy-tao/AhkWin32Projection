#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISVGTests extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISVGTests
     * @type {Guid}
     */
    static IID => Guid("{305104dd-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_requiredFeatures", "get_requiredExtensions", "get_systemLanguage", "hasExtension"]

    /**
     * 
     * @param {Pointer<ISVGStringList>} p 
     * @returns {HRESULT} 
     */
    get_requiredFeatures(p) {
        result := ComCall(7, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGStringList>} p 
     * @returns {HRESULT} 
     */
    get_requiredExtensions(p) {
        result := ComCall(8, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISVGStringList>} p 
     * @returns {HRESULT} 
     */
    get_systemLanguage(p) {
        result := ComCall(9, this, "ptr*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} extension 
     * @param {Pointer<VARIANT_BOOL>} pResult 
     * @returns {HRESULT} 
     */
    hasExtension(extension, pResult) {
        extension := extension is String ? BSTR.Alloc(extension).Value : extension

        result := ComCall(10, this, "ptr", extension, "ptr", pResult, "HRESULT")
        return result
    }
}
