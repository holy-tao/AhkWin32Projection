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
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(9, this, "int", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(10, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(11, this, "ptr", contextId, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(12, this, "ptr", type, "ptr", jpegquality, "ptr", pUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
