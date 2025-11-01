#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHighlightRenderingServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHighlightRenderingServices
     * @type {Guid}
     */
    static IID => Guid("{3050f606-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSegment", "MoveSegmentToPointers", "RemoveSegment"]

    /**
     * 
     * @param {IDisplayPointer} pDispPointerStart 
     * @param {IDisplayPointer} pDispPointerEnd 
     * @param {IHTMLRenderStyle} pIRenderStyle 
     * @param {Pointer<IHighlightSegment>} ppISegment 
     * @returns {HRESULT} 
     */
    AddSegment(pDispPointerStart, pDispPointerEnd, pIRenderStyle, ppISegment) {
        result := ComCall(3, this, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "ptr", pIRenderStyle, "ptr*", ppISegment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHighlightSegment} pISegment 
     * @param {IDisplayPointer} pDispPointerStart 
     * @param {IDisplayPointer} pDispPointerEnd 
     * @returns {HRESULT} 
     */
    MoveSegmentToPointers(pISegment, pDispPointerStart, pDispPointerEnd) {
        result := ComCall(4, this, "ptr", pISegment, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IHighlightSegment} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(5, this, "ptr", pISegment, "HRESULT")
        return result
    }
}
