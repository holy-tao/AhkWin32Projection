#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLElement.ahk
#Include .\IHTMLDOMChildrenCollection.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IElementSelector extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementSelector
     * @type {Guid}
     */
    static IID => Guid("{30510463-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["querySelector", "querySelectorAll"]

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLElement} 
     */
    querySelector(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(7, this, "ptr", v, "ptr*", &pel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLElement(pel)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {IHTMLDOMChildrenCollection} 
     */
    querySelectorAll(v) {
        if(v is String) {
            pin := BSTR.Alloc(v)
            v := pin.Value
        }

        result := ComCall(8, this, "ptr", v, "ptr*", &pel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMChildrenCollection(pel)
    }
}
