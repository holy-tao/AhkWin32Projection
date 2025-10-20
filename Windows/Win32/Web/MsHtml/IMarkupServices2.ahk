#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMarkupServices.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IMarkupServices2 extends IMarkupServices{
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
     * 
     * @param {HGLOBAL} hglobalHTML 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMarkupContainer>} pContext 
     * @param {Pointer<IMarkupContainer>} ppContainerResult 
     * @param {Pointer<IMarkupPointer>} pPointerStart 
     * @param {Pointer<IMarkupPointer>} pPointerFinish 
     * @returns {HRESULT} 
     */
    ParseGlobalEx(hglobalHTML, dwFlags, pContext, ppContainerResult, pPointerStart, pPointerFinish) {
        hglobalHTML := hglobalHTML is Win32Handle ? NumGet(hglobalHTML, "ptr") : hglobalHTML

        result := ComCall(23, this, "ptr", hglobalHTML, "uint", dwFlags, "ptr", pContext, "ptr", ppContainerResult, "ptr", pPointerStart, "ptr", pPointerFinish, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMarkupPointer>} pPointerStart 
     * @param {Pointer<IMarkupPointer>} pPointerFinish 
     * @param {Pointer<IMarkupPointer>} pPointerTarget 
     * @param {Pointer<IMarkupPointer>} pPointerStatus 
     * @param {Pointer<IHTMLElement>} ppElemFailBottom 
     * @param {Pointer<IHTMLElement>} ppElemFailTop 
     * @returns {HRESULT} 
     */
    ValidateElements(pPointerStart, pPointerFinish, pPointerTarget, pPointerStatus, ppElemFailBottom, ppElemFailTop) {
        result := ComCall(24, this, "ptr", pPointerStart, "ptr", pPointerFinish, "ptr", pPointerTarget, "ptr", pPointerStatus, "ptr", ppElemFailBottom, "ptr", ppElemFailTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISegmentList>} pSegmentList 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SaveSegmentsToClipboard(pSegmentList, dwFlags) {
        result := ComCall(25, this, "ptr", pSegmentList, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
