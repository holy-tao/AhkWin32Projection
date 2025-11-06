#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAttributeCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAttributeCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f4c3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLAttributeCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4cc-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get__newEnum", "item"]

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IUnknown(p)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} name 
     * @returns {IDispatch} 
     */
    item(name) {
        result := ComCall(9, this, "ptr", name, "ptr*", &pdisp := 0, "HRESULT")
        return IDispatch(pdisp)
    }
}
