#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCanvasElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCanvasElement
     * @type {Guid}
     */
    static IID => Guid("{305106e4-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLCanvasElement
     * @type {Guid}
     */
    static CLSID => Guid("{305106e5-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_width", "get_width", "put_height", "get_height", "getContext", "toDataURL"]

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(8, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(9, this, "int", v, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(10, this, "int*", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {Pointer<ICanvasRenderingContext2D>} ppContext 
     * @returns {HRESULT} 
     */
    getContext(contextId, ppContext) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(11, this, "ptr", contextId, "ptr*", ppContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {VARIANT} jpegquality 
     * @param {Pointer<BSTR>} pUrl 
     * @returns {HRESULT} 
     */
    toDataURL(type, jpegquality, pUrl) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(12, this, "ptr", type, "ptr", jpegquality, "ptr", pUrl, "HRESULT")
        return result
    }
}
