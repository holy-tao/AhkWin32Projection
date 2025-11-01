#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupServices.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupServices2 extends IMarkupServices{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMarkupServices2
     * @type {Guid}
     */
    static IID => Guid("{3050f682-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ParseGlobalEx", "ValidateElements", "SaveSegmentsToClipboard"]

    /**
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {IMarkupContainer} pContext 
     * @param {Pointer<IMarkupContainer>} ppContainerResult 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @returns {HRESULT} 
     */
    ParseGlobalEx(hglobalHTML, dwFlags, pContext, ppContainerResult, pPointerStart, pPointerFinish) {
        hglobalHTML := hglobalHTML is Win32Handle ? NumGet(hglobalHTML, "ptr") : hglobalHTML

        result := ComCall(23, this, "ptr", hglobalHTML, "uint", dwFlags, "ptr", pContext, "ptr*", ppContainerResult, "ptr", pPointerStart, "ptr", pPointerFinish, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerStart 
     * @param {IMarkupPointer} pPointerFinish 
     * @param {IMarkupPointer} pPointerTarget 
     * @param {IMarkupPointer} pPointerStatus 
     * @param {Pointer<IHTMLElement>} ppElemFailBottom 
     * @param {Pointer<IHTMLElement>} ppElemFailTop 
     * @returns {HRESULT} 
     */
    ValidateElements(pPointerStart, pPointerFinish, pPointerTarget, pPointerStatus, ppElemFailBottom, ppElemFailTop) {
        result := ComCall(24, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pPointerTarget, "ptr", pPointerStatus, "ptr*", ppElemFailBottom, "ptr*", ppElemFailTop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISegmentList} pSegmentList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveSegmentsToClipboard(pSegmentList, dwFlags) {
        result := ComCall(25, this, "ptr", pSegmentList, "uint", dwFlags, "HRESULT")
        return result
    }
}
