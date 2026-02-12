#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHTMLDOMNode.ahk
#Include .\IHTMLDOMRange.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLSelection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLSelection
     * @type {Guid}
     */
    static IID => Guid("{305104b6-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_anchorNode", "get_anchorOffset", "get_focusNode", "get_focusOffset", "get_isCollapsed", "collapse", "collapseToStart", "collapseToEnd", "selectAllChildren", "deleteFromDocument", "get_rangeCount", "getRangeAt", "addRange", "removeRange", "removeAllRanges", "toString"]

    /**
     * @type {IHTMLDOMNode} 
     */
    anchorNode {
        get => this.get_anchorNode()
    }

    /**
     * @type {Integer} 
     */
    anchorOffset {
        get => this.get_anchorOffset()
    }

    /**
     * @type {IHTMLDOMNode} 
     */
    focusNode {
        get => this.get_focusNode()
    }

    /**
     * @type {Integer} 
     */
    focusOffset {
        get => this.get_focusOffset()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    isCollapsed {
        get => this.get_isCollapsed()
    }

    /**
     * @type {Integer} 
     */
    rangeCount {
        get => this.get_rangeCount()
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_anchorNode() {
        result := ComCall(7, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_anchorOffset() {
        result := ComCall(8, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {IHTMLDOMNode} 
     */
    get_focusNode() {
        result := ComCall(9, this, "ptr*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMNode(p)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_focusOffset() {
        result := ComCall(10, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_isCollapsed() {
        result := ComCall(11, this, "short*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @param {Integer} offfset 
     * @returns {HRESULT} 
     */
    collapse(parentNode, offfset) {
        result := ComCall(12, this, "ptr", parentNode, "int", offfset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToStart() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    collapseToEnd() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDispatch} parentNode 
     * @returns {HRESULT} 
     */
    selectAllChildren(parentNode) {
        result := ComCall(15, this, "ptr", parentNode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    deleteFromDocument() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_rangeCount() {
        result := ComCall(17, this, "int*", &p := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IHTMLDOMRange} 
     */
    getRangeAt(index) {
        result := ComCall(18, this, "int", index, "ptr*", &ppRange := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMRange(ppRange)
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    addRange(range) {
        result := ComCall(19, this, "ptr", range, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDispatch} range 
     * @returns {HRESULT} 
     */
    removeRange(range) {
        result := ComCall(20, this, "ptr", range, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    removeAllRanges() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
        pSelectionString := BSTR()
        result := ComCall(22, this, "ptr", pSelectionString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSelectionString
    }
}
