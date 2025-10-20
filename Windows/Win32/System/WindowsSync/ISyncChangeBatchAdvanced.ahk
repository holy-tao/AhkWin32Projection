#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ISyncFilterInfo>} ppFilterInfo 
     * @returns {HRESULT} 
     */
    GetFilterInfo(ppFilterInfo) {
        result := ComCall(3, this, "ptr", ppFilterInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChangeBatch>} ppChangeBatch 
     * @returns {HRESULT} 
     */
    ConvertFullEnumerationChangeBatchToRegularChangeBatch(ppChangeBatch) {
        result := ComCall(4, this, "ptr", ppChangeBatch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetUpperBoundItemId(pbItemId, pcbIdSize) {
        result := ComCall(5, this, "char*", pbItemId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfBatchKnowledgeShouldBeApplied 
     * @returns {HRESULT} 
     */
    GetBatchLevelKnowledgeShouldBeApplied(pfBatchKnowledgeShouldBeApplied) {
        result := ComCall(6, this, "ptr", pfBatchKnowledgeShouldBeApplied, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
