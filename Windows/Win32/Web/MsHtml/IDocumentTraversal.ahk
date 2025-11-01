#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDocumentTraversal extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocumentTraversal
     * @type {Guid}
     */
    static IID => Guid("{30510744-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createNodeIterator", "createTreeWalker"]

    /**
     * 
     * @param {IDispatch} pRootNode 
     * @param {Integer} ulWhatToShow 
     * @param {Pointer<VARIANT>} pFilter 
     * @param {VARIANT_BOOL} fEntityReferenceExpansion 
     * @param {Pointer<IDOMNodeIterator>} ppNodeIterator 
     * @returns {HRESULT} 
     */
    createNodeIterator(pRootNode, ulWhatToShow, pFilter, fEntityReferenceExpansion, ppNodeIterator) {
        result := ComCall(7, this, "ptr", pRootNode, "int", ulWhatToShow, "ptr", pFilter, "short", fEntityReferenceExpansion, "ptr*", ppNodeIterator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pRootNode 
     * @param {Integer} ulWhatToShow 
     * @param {Pointer<VARIANT>} pFilter 
     * @param {VARIANT_BOOL} fEntityReferenceExpansion 
     * @param {Pointer<IDOMTreeWalker>} ppTreeWalker 
     * @returns {HRESULT} 
     */
    createTreeWalker(pRootNode, ulWhatToShow, pFilter, fEntityReferenceExpansion, ppTreeWalker) {
        result := ComCall(8, this, "ptr", pRootNode, "int", ulWhatToShow, "ptr", pFilter, "short", fEntityReferenceExpansion, "ptr*", ppTreeWalker, "HRESULT")
        return result
    }
}
