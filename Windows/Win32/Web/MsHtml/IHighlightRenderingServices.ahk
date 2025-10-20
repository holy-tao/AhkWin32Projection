#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHighlightRenderingServices extends IUnknown{
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
     * 
     * @param {Pointer<IDisplayPointer>} pDispPointerStart 
     * @param {Pointer<IDisplayPointer>} pDispPointerEnd 
     * @param {Pointer<IHTMLRenderStyle>} pIRenderStyle 
     * @param {Pointer<IHighlightSegment>} ppISegment 
     * @returns {HRESULT} 
     */
    AddSegment(pDispPointerStart, pDispPointerEnd, pIRenderStyle, ppISegment) {
        result := ComCall(3, this, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "ptr", pIRenderStyle, "ptr", ppISegment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHighlightSegment>} pISegment 
     * @param {Pointer<IDisplayPointer>} pDispPointerStart 
     * @param {Pointer<IDisplayPointer>} pDispPointerEnd 
     * @returns {HRESULT} 
     */
    MoveSegmentToPointers(pISegment, pDispPointerStart, pDispPointerEnd) {
        result := ComCall(4, this, "ptr", pISegment, "ptr", pDispPointerStart, "ptr", pDispPointerEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHighlightSegment>} pISegment 
     * @returns {HRESULT} 
     */
    RemoveSegment(pISegment) {
        result := ComCall(5, this, "ptr", pISegment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
