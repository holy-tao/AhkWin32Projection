#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ICanvasRenderingContext2D.ahk
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
     * @type {Integer} 
     */
    width {
        get => this.get_width()
        set => this.put_width(value)
    }

    /**
     * @type {Integer} 
     */
    height {
        get => this.get_height()
        set => this.put_height(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_width(v) {
        result := ComCall(7, this, "int", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_width() {
        result := ComCall(8, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_height(v) {
        result := ComCall(9, this, "int", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_height() {
        result := ComCall(10, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @returns {ICanvasRenderingContext2D} 
     */
    getContext(contextId) {
        if(contextId is String) {
            pin := BSTR.Alloc(contextId)
            contextId := pin.Value
        }

        result := ComCall(11, this, "ptr", contextId, "ptr*", &ppContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICanvasRenderingContext2D(ppContext)
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {VARIANT} jpegquality 
     * @returns {BSTR} 
     */
    toDataURL(type, jpegquality) {
        if(type is String) {
            pin := BSTR.Alloc(type)
            type := pin.Value
        }

        pUrl := BSTR()
        result := ComCall(12, this, "ptr", type, "ptr", jpegquality, "ptr", pUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pUrl
    }
}
