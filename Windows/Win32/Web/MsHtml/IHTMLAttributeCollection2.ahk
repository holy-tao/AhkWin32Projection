#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMAttribute.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLAttributeCollection2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLAttributeCollection2
     * @type {Guid}
     */
    static IID => Guid("{3050f80a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getNamedItem", "setNamedItem", "removeNamedItem"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    getNamedItem(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrName, "ptr*", &newretNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMAttribute(newretNode)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute} ppNode 
     * @returns {IHTMLDOMAttribute} 
     */
    setNamedItem(ppNode) {
        result := ComCall(8, this, "ptr", ppNode, "ptr*", &newretNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMAttribute(newretNode)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IHTMLDOMAttribute} 
     */
    removeNamedItem(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrName, "ptr*", &newretNode := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IHTMLDOMAttribute(newretNode)
    }
}
