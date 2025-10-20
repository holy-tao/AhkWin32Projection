#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLDocumentCompatibleInfoCollection extends IDispatch{
    /**
     * The interface identifier for IHTMLDocumentCompatibleInfoCollection
     * @type {Guid}
     */
    static IID => Guid("{30510418-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDocumentCompatibleInfoCollection
     * @type {Guid}
     */
    static CLSID => Guid("{30510419-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_length(p) {
        result := ComCall(7, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IHTMLDocumentCompatibleInfo>} compatibleInfo 
     * @returns {HRESULT} 
     */
    item(index, compatibleInfo) {
        result := ComCall(8, this, "int", index, "ptr", compatibleInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
