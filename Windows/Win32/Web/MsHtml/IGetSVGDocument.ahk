#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IGetSVGDocument extends IDispatch{
    /**
     * The interface identifier for IGetSVGDocument
     * @type {Guid}
     */
    static IID => Guid("{305105ab-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} ppSVGDocument 
     * @returns {HRESULT} 
     */
    getSVGDocument(ppSVGDocument) {
        result := ComCall(7, this, "ptr", ppSVGDocument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
