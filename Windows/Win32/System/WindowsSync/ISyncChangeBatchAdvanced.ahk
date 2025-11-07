#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk
#Include .\ISyncChangeBatch.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents additional information about a set of changes.
 * @remarks
 * 
 * An <b>ISyncChangeBatchAdvanced</b> object can be obtained by passing <b>IID_ISyncChangeBatchAdvanced</b> to the <b>QueryInterface</b> method of a change batch object, such as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatch">ISyncChangeBatch</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncfullenumerationchangebatch">ISyncFullEnumerationChangeBatch</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchadvanced
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchAdvanced
     * @type {Guid}
     */
    static IID => Guid("{0f1a4995-cbc8-421d-b550-5d0bebf3e9a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilterInfo", "ConvertFullEnumerationChangeBatchToRegularChangeBatch", "GetUpperBoundItemId", "GetBatchLevelKnowledgeShouldBeApplied"]

    /**
     * 
     * @returns {ISyncFilterInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getfilterinfo
     */
    GetFilterInfo() {
        result := ComCall(3, this, "ptr*", &ppFilterInfo := 0, "HRESULT")
        return ISyncFilterInfo(ppFilterInfo)
    }

    /**
     * 
     * @returns {ISyncChangeBatch} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-convertfullenumerationchangebatchtoregularchangebatch
     */
    ConvertFullEnumerationChangeBatchToRegularChangeBatch() {
        result := ComCall(4, this, "ptr*", &ppChangeBatch := 0, "HRESULT")
        return ISyncChangeBatch(ppChangeBatch)
    }

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getupperbounditemid
     */
    GetUpperBoundItemId(pbItemId, pcbIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbItemIdMarshal, pbItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfBatchKnowledgeShouldBeApplied 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangebatchadvanced-getbatchlevelknowledgeshouldbeapplied
     */
    GetBatchLevelKnowledgeShouldBeApplied(pfBatchKnowledgeShouldBeApplied) {
        pfBatchKnowledgeShouldBeAppliedMarshal := pfBatchKnowledgeShouldBeApplied is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfBatchKnowledgeShouldBeAppliedMarshal, pfBatchKnowledgeShouldBeApplied, "HRESULT")
        return result
    }
}
