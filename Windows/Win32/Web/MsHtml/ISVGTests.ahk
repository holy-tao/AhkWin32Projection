#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISVGStringList.ahk
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
     * @type {ISVGStringList} 
     */
    requiredFeatures {
        get => this.get_requiredFeatures()
    }

    /**
     * @type {ISVGStringList} 
     */
    requiredExtensions {
        get => this.get_requiredExtensions()
    }

    /**
     * @type {ISVGStringList} 
     */
    systemLanguage {
        get => this.get_systemLanguage()
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_requiredFeatures() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_requiredExtensions() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @returns {ISVGStringList} 
     */
    get_systemLanguage() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return ISVGStringList(p)
    }

    /**
     * 
     * @param {BSTR} extension 
     * @returns {VARIANT_BOOL} 
     */
    hasExtension(extension) {
        extension := extension is String ? BSTR.Alloc(extension).Value : extension

        result := ComCall(10, this, "ptr", extension, "short*", &pResult := 0, "HRESULT")
        return pResult
    }
}
