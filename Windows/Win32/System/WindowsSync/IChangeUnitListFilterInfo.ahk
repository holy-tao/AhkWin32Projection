#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncFilterInfo.ahk

/**
 * Represents a filter that can be used to control which change units are included for items in an ISyncChangeBatch object.
 * @remarks
 * 
  * If a provider filters the contents of a change batch that it creates, it must create a filtered <b>ISyncChangeBatch</b> object instead of a standard change batch object. The filtered change batch object contains an <b>IChangeUnitListFilterInfo</b> object that describes how the contents of the change batch were filtered.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ichangeunitlistfilterinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IChangeUnitListFilterInfo extends ISyncFilterInfo{
    /**
     * The interface identifier for IChangeUnitListFilterInfo
     * @type {Guid}
     */
    static IID => Guid("{f2837671-0bdf-43fa-b502-232375fb50c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Byte>} ppbChangeUnitIds 
     * @param {Integer} dwChangeUnitCount 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(ppbChangeUnitIds, dwChangeUnitCount) {
        result := ComCall(4, this, "char*", ppbChangeUnitIds, "uint", dwChangeUnitCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwChangeUnitIdCount 
     * @returns {HRESULT} 
     */
    GetChangeUnitIdCount(pdwChangeUnitIdCount) {
        result := ComCall(5, this, "uint*", pdwChangeUnitIdCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChangeUnitIdIndex 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetChangeUnitId(dwChangeUnitIdIndex, pbChangeUnitId, pcbIdSize) {
        result := ComCall(6, this, "uint", dwChangeUnitIdIndex, "char*", pbChangeUnitId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
