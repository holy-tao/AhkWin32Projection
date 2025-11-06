#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLAreasCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLMapElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLMapElement
     * @type {Guid}
     */
    static IID => Guid("{3050f266-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLMapElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f271-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_areas", "put_name", "get_name"]

    /**
     * 
     * @returns {IHTMLAreasCollection} 
     */
    get_areas() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLAreasCollection(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_name(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(8, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "HRESULT")
        return p
    }
}
