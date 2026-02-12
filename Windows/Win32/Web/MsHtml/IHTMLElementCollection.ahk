#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElementCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElementCollection
     * @type {Guid}
     */
    static IID => Guid("{3050f21f-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLElementCollection
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4cb-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["toString", "put_length", "get_length", "get__newEnum", "item", "tags"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * toString Method (DateTimeOffset)
     * @remarks
     * The string has the format `YYYY-MM-DD HH:mm:ss[.fffffff] [+|-]HH:mm`.  
     *   
     *  The fractional seconds of the returned string are zero padded to the declared precision. For example, a **datetimeoffset(6)** with a value of "2010-03-10 12:34:56.78 -08:00" will be formatted by DateTimeOffset.toString as "2010-03-10 12:34:56.780000 -08:00".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/tostring-method-datetimeoffset
     */
    toString() {
        String_ := BSTR()
        result := ComCall(7, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return String_
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(8, this, "int", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(9, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(10, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(p)
    }

    /**
     * 
     * @param {VARIANT} name 
     * @param {VARIANT} index 
     * @returns {IDispatch} 
     */
    item(name, index) {
        result := ComCall(11, this, "ptr", name, "ptr", index, "ptr*", &pdisp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(pdisp)
    }

    /**
     * 
     * @param {VARIANT} tagName 
     * @returns {IDispatch} 
     */
    tags(tagName) {
        result := ComCall(12, this, "ptr", tagName, "ptr*", &pdisp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(pdisp)
    }
}
