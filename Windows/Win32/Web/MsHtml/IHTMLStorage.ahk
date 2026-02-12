#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLStorage extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLStorage
     * @type {Guid}
     */
    static IID => Guid("{30510474-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStorage
     * @type {Guid}
     */
    static CLSID => Guid("{30510475-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_length", "get_remainingSpace", "key", "getItem", "setItem", "removeItem", "clear"]

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {Integer} 
     */
    remainingSpace {
        get => this.get_remainingSpace()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_remainingSpace() {
        result := ComCall(8, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * Synthesizes a keystroke.
     * @remarks
     * An application can simulate a press of the PRINTSCRN key in order to obtain a screen snapshot and save it to the clipboard. To do this, call <b>keybd_event</b> with the 
     * 				<i>bVk</i> parameter set to <b>VK_SNAPSHOT</b>.
     * @param {Integer} lIndex 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-keybd_event
     */
    key(lIndex) {
        __MIDL__IHTMLStorage0000 := BSTR()
        result := ComCall(9, this, "int", lIndex, "ptr", __MIDL__IHTMLStorage0000, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return __MIDL__IHTMLStorage0000
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {VARIANT} 
     */
    getItem(bstrKey) {
        if(bstrKey is String) {
            pin := BSTR.Alloc(bstrKey)
            bstrKey := pin.Value
        }

        __MIDL__IHTMLStorage0001 := VARIANT()
        result := ComCall(10, this, "ptr", bstrKey, "ptr", __MIDL__IHTMLStorage0001, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return __MIDL__IHTMLStorage0001
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setItem(bstrKey, bstrValue) {
        if(bstrKey is String) {
            pin := BSTR.Alloc(bstrKey)
            bstrKey := pin.Value
        }
        if(bstrValue is String) {
            pin := BSTR.Alloc(bstrValue)
            bstrValue := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrKey, "ptr", bstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    removeItem(bstrKey) {
        if(bstrKey is String) {
            pin := BSTR.Alloc(bstrKey)
            bstrKey := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrKey, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * clearBatch Method (SQLServerStatement)
     * @remarks
     * This clearBatch method is specified by the clearBatch method in the java.sql.Statement interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/jdbc/reference/clearbatch-method-sqlserverstatement
     */
    clear() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
