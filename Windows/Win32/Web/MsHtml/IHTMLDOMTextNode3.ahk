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
class IHTMLDOMTextNode3 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLDOMTextNode3
     * @type {Guid}
     */
    static IID => Guid("{3051073e-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["substringData", "insertData", "deleteData", "replaceData", "splitText", "get_wholeText", "replaceWholeText", "hasAttributes", "normalize"]

    /**
     * @type {BSTR} 
     */
    wholeText {
        get => this.get_wholeText()
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} Count 
     * @returns {BSTR} 
     */
    substringData(offset, Count) {
        pbstrsubString := BSTR()
        result := ComCall(7, this, "int", offset, "int", Count, "ptr", pbstrsubString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrsubString
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

        result := ComCall(8, this, "int", offset, "ptr", bstrstring, "int")
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
        result := ComCall(9, this, "int", offset, "int", Count, "int")
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

        result := ComCall(10, this, "int", offset, "int", Count, "ptr", bstrstring, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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

    /**
     * 
     * @returns {BSTR} 
     */
    get_wholeText() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {BSTR} bstrText 
     * @returns {IHTMLDOMNode} 
     */
    replaceWholeText(bstrText) {
        if(bstrText is String) {
            pin := BSTR.Alloc(bstrText)
            bstrText := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrText, "ptr*", &ppRetNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(ppRetNode)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(14, this, "short*", &pfHasAttributes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfHasAttributes
    }

    /**
     * Normalizes the specified floating-point vector according to x / length(x).
     * @remarks
     * The **normalize** HLSL intrinsic function uses the following formula: *x* / [**length**](dx-graphics-hlsl-length.md)(*x*).
     * @returns {HRESULT} | Item                                                   | Description                                            |
     * |--------------------------------------------------------|--------------------------------------------------------|
     * | <span id="x"></span><span id="X"></span>*x*<br/> | \[in\] The specified floating-point vector.<br/> |
     * 
     * 
     * 
     *  
     * 
     * 
     * The normalized *x* parameter. If the length of the *x* parameter is 0, the result is indefinite.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/dx-graphics-hlsl-normalize
     */
    normalize() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
