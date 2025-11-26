#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVectorElement.ahk

/**
 * Represents a clock vector element that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifeedclockvectorelement
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFeedClockVectorElement extends IClockVectorElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedClockVectorElement
     * @type {Guid}
     */
    static IID => Guid("{a40b46d2-e97b-4156-b6da-991f501b0f05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncTime", "GetFlags"]

    /**
     * Gets a SYNC_TIME value that corresponds to the when value for the item.
     * @param {Pointer<SYNC_TIME>} pSyncTime Returns a <a href="https://docs.microsoft.com/windows/desktop/api/winsync/ns-winsync-sync_time">SYNC_TIME</a> value that corresponds to the <b>when</b> value for the item.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ifeedclockvectorelement-getsynctime
     */
    GetSyncTime(pSyncTime) {
        result := ComCall(5, this, "ptr", pSyncTime, "HRESULT")
        return result
    }

    /**
     * Gets flags that specify additional information about the clock vector element.
     * @param {Pointer<Integer>} pbFlags Returns flags that specify additional information about the clock vector element. These flags will be a combination of the <b>SYNC_VERSION_FLAG</b> flags.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-ifeedclockvectorelement-getflags
     */
    GetFlags(pbFlags) {
        pbFlagsMarshal := pbFlags is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbFlagsMarshal, pbFlags, "HRESULT")
        return result
    }
}
