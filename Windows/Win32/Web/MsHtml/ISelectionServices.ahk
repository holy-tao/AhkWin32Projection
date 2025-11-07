#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupContainer.ahk
#Include .\ISegment.ahk
#Include .\IElementSegment.ahk
#Include .\ISelectionServicesListener.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISelectionServices extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSelectionType", "GetMarkupContainer", "AddSegment", "AddElementSegment", "RemoveSegment", "GetSelectionServicesListener"]

    /**
     * 
     * @param {Integer} eType 
     * @param {ISelectionServicesListener} pIListener 
     * @returns {HRESULT} 
     */
    SetSelectionType(eType, pIListener) {
        result := ComCall(3, this, "int", eType, "ptr", pIListener, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMarkupContainer} 
     */
    GetMarkupContainer() {
        result := ComCall(4, this, "ptr*", &ppIContainer := 0, "HRESULT")
        return IMarkupContainer(ppIContainer)
    }

    /**
     * 
     * @param {IMarkupPointer} pIStart 
     * @param {IMarkupPointer} pIEnd 
     * @returns {ISegment} 
     */
    AddSegment(pIStart, pIEnd) {
        result := ComCall(5, this, "ptr", pIStart, "ptr", pIEnd, "ptr*", &ppISegmentAdded := 0, "HRESULT")
        return ISegment(ppISegmentAdded)
    }

    /**
     * 
     * @param {IHTMLElement} pIElement 
     * @returns {IElementSegment} 
     */
    AddElementSegment(pIElement) {
        result := ComCall(6, this, "ptr", pIElement, "ptr*", &ppISegmentAdded := 0, "HRESULT")
        return IElementSegment(ppISegmentAdded)
    }

    /**
     * 
     * @param {ISegment} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(7, this, "ptr", pISegment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISelectionServicesListener} 
     */
    GetSelectionServicesListener() {
        result := ComCall(8, this, "ptr*", &ppISelectionServicesListener := 0, "HRESULT")
        return ISelectionServicesListener(ppISelectionServicesListener)
    }
}
