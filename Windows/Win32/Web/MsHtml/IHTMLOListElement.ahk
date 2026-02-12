#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLOListElement extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLOListElement
     * @type {Guid}
     */
    static IID => Guid("{3050f1de-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLOListElement
     * @type {Guid}
     */
    static CLSID => Guid("{3050f270-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_compact", "get_compact", "put_start", "get_start", "put_type", "get_type"]

    /**
     * @type {VARIANT_BOOL} 
     */
    compact {
        get => this.get_compact()
        set => this.put_compact(value)
    }

    /**
     * @type {Integer} 
     */
    start {
        get => this.get_start()
        set => this.put_start(value)
    }

    /**
     * @type {BSTR} 
     */
    type {
        get => this.get_type()
        set => this.put_type(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} v 
     * @returns {HRESULT} 
     */
    put_compact(v) {
        result := ComCall(7, this, "short", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_compact() {
        result := ComCall(8, this, "short*", &p := 0, "int")
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
    put_start(v) {
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
    get_start() {
        result := ComCall(10, this, "int*", &p := 0, "int")
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
    put_type(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_type() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }
}
