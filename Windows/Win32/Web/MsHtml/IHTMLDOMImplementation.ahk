#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMImplementation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMImplementation
     * @type {Guid}
     */
    static IID => Guid("{3050f80d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMImplementation
     * @type {Guid}
     */
    static CLSID => Guid("{3050f80e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["hasFeature"]

    /**
     * 
     * @param {BSTR} bstrfeature 
     * @param {VARIANT} version 
     * @returns {VARIANT_BOOL} 
     */
    hasFeature(bstrfeature, version) {
        bstrfeature := bstrfeature is String ? BSTR.Alloc(bstrfeature).Value : bstrfeature

        result := ComCall(7, this, "ptr", bstrfeature, "ptr", version, "short*", &pfHasFeature := 0, "HRESULT")
        return pfHasFeature
    }
}
