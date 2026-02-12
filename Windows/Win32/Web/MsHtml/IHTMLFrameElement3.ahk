#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLFrameElement3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLFrameElement3
     * @type {Guid}
     */
    static IID => Guid("{3051042d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_contentDocument", "put_src", "get_src", "put_longDesc", "get_longDesc", "put_frameBorder", "get_frameBorder"]

    /**
     * @type {IDispatch} 
     */
    contentDocument {
        get => this.get_contentDocument()
    }

    /**
     * @type {BSTR} 
     */
    src {
        get => this.get_src()
        set => this.put_src(value)
    }

    /**
     * @type {BSTR} 
     */
    longDesc {
        get => this.get_longDesc()
        set => this.put_longDesc(value)
    }

    /**
     * @type {BSTR} 
     */
    frameBorder {
        get => this.get_frameBorder()
        set => this.put_frameBorder(value)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_contentDocument() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_src(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(8, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_src() {
        p := BSTR()
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_longDesc(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(10, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_longDesc() {
        p := BSTR()
        result := ComCall(11, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_frameBorder(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(12, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_frameBorder() {
        p := BSTR()
        result := ComCall(13, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }
}
