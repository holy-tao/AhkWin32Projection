#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISelectionServices extends IUnknown{
    /**
     * The interface identifier for ISelectionServices
     * @type {Guid}
     */
    static IID => Guid("{3050f684-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} eType 
     * @param {Pointer<ISelectionServicesListener>} pIListener 
     * @returns {HRESULT} 
     */
    SetSelectionType(eType, pIListener) {
        result := ComCall(3, this, "int", eType, "ptr", pIListener, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupContainer>} ppIContainer 
     * @returns {HRESULT} 
     */
    GetMarkupContainer(ppIContainer) {
        result := ComCall(4, this, "ptr", ppIContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pIStart 
     * @param {Pointer<IMarkupPointer>} pIEnd 
     * @param {Pointer<ISegment>} ppISegmentAdded 
     * @returns {HRESULT} 
     */
    AddSegment(pIStart, pIEnd, ppISegmentAdded) {
        result := ComCall(5, this, "ptr", pIStart, "ptr", pIEnd, "ptr", ppISegmentAdded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHTMLElement>} pIElement 
     * @param {Pointer<IElementSegment>} ppISegmentAdded 
     * @returns {HRESULT} 
     */
    AddElementSegment(pIElement, ppISegmentAdded) {
        result := ComCall(6, this, "ptr", pIElement, "ptr", ppISegmentAdded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISegment>} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(7, this, "ptr", pISegment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISelectionServicesListener>} ppISelectionServicesListener 
     * @returns {HRESULT} 
     */
    GetSelectionServicesListener(ppISelectionServicesListener) {
        result := ComCall(8, this, "ptr", ppISelectionServicesListener, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
