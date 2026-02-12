#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMNode.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDOMTextNode extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMTextNode
     * @type {Guid}
     */
    static IID => Guid("{3050f4b1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDOMTextNode
     * @type {Guid}
     */
    static CLSID => Guid("{3050f4ba-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_data", "get_data", "toString", "get_length", "splitText"]

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_data(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(7, this, "ptr", v, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        p := BSTR()
        result := ComCall(8, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
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
        result := ComCall(9, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return String_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Integer} offset 
     * @returns {IHTMLDOMNode} 
     */
    splitText(offset) {
        result := ComCall(11, this, "int", offset, "ptr*", &pRetNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(pRetNode)
    }
}
