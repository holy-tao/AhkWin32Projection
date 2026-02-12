#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSubmitData extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSubmitData
     * @type {Guid}
     */
    static IID => Guid("{3050f645-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["appendNameValuePair", "appendNameFilePair", "appendItemSeparator"]

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    appendNameValuePair(name, value) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(value is String) {
            pin := BSTR.Alloc(value)
            value := pin.Value
        }

        result := ComCall(7, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} filename 
     * @returns {HRESULT} 
     */
    appendNameFilePair(name, filename) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }
        if(filename is String) {
            pin := BSTR.Alloc(filename)
            filename := pin.Value
        }

        result := ComCall(8, this, "ptr", name, "ptr", filename, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    appendItemSeparator() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
