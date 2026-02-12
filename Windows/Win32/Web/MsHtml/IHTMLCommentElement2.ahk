#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLCommentElement2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLCommentElement2
     * @type {Guid}
     */
    static IID => Guid("{3050f813-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_data", "get_data", "get_length", "substringData", "appendData", "insertData", "deleteData", "replaceData"]

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
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {BSTR} 
     */
    substringData(offset, Count) {
        pbstrsubString := BSTR()
        result := ComCall(10, this, "int", offset, "int", Count, "ptr", pbstrsubString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrsubString
    }

    /**
     * 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    appendData(bstrstring) {
        if(bstrstring is String) {
            pin := BSTR.Alloc(bstrstring)
            bstrstring := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrstring, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    insertData(offset, bstrstring) {
        if(bstrstring is String) {
            pin := BSTR.Alloc(bstrstring)
            bstrstring := pin.Value
        }

        result := ComCall(12, this, "int", offset, "ptr", bstrstring, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    deleteData(offset, Count) {
        result := ComCall(13, this, "int", offset, "int", Count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @param {BSTR} bstrstring 
     * @returns {HRESULT} 
     */
    replaceData(offset, Count, bstrstring) {
        if(bstrstring is String) {
            pin := BSTR.Alloc(bstrstring)
            bstrstring := pin.Value
        }

        result := ComCall(14, this, "int", offset, "int", Count, "ptr", bstrstring, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
