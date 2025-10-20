#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLEditServices extends IUnknown{
    /**
     * The interface identifier for IHTMLEditServices
     * @type {Guid}
     */
    static IID => Guid("{3050f663-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IHTMLEditDesigner>} pIDesigner 
     * @returns {HRESULT} 
     */
    AddDesigner(pIDesigner) {
        result := ComCall(3, this, "ptr", pIDesigner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLEditDesigner>} pIDesigner 
     * @returns {HRESULT} 
     */
    RemoveDesigner(pIDesigner) {
        result := ComCall(4, this, "ptr", pIDesigner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} pIContainer 
     * @param {Pointer<ISelectionServices>} ppSelSvc 
     * @returns {HRESULT} 
     */
    GetSelectionServices(pIContainer, ppSelSvc) {
        result := ComCall(5, this, "ptr", pIContainer, "ptr", ppSelSvc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pIStartAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionAnchor(pIStartAnchor) {
        result := ComCall(6, this, "ptr", pIStartAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pIEndAnchor 
     * @returns {HRESULT} 
     */
    MoveToSelectionEnd(pIEndAnchor) {
        result := ComCall(7, this, "ptr", pIEndAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pStart 
     * @param {Pointer<IMarkupPointer>} pEnd 
     * @param {Integer} eType 
     * @returns {HRESULT} 
     */
    SelectRange(pStart, pEnd, eType) {
        result := ComCall(8, this, "ptr", pStart, "ptr", pEnd, "int", eType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
