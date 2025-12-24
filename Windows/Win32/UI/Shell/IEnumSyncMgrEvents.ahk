#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncMgrEvents.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes sync event enumeration methods.
 * @remarks
 * 
 * An event store returns a pointer to an <b>IEnumSyncMgrEvents</b> interface from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgreventstore-geteventenumerator">ISyncMgrEventStore::GetEventEnumerator</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nn-syncmgr-ienumsyncmgrevents
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumSyncMgrEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncMgrEvents
     * @type {Guid}
     */
    static IID => Guid("{c81a1d4e-8cf7-4683-80e0-bcae88d677b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * Gets the next batch of events from the event store.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * This value must be 1.
     * @param {Pointer<ISyncMgrEvent>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-isyncmgrevent">ISyncMgrEvent</a> interface pointer.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of events fetched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrevents-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips forward the specified number of events in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of events to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrevents-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the current location in the enumeration to zero.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrevents-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones an IEnumSyncMgrEvents object.
     * @returns {IEnumSyncMgrEvents} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a>**</b>
     * 
     * The address of the cloned <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nn-syncmgr-ienumsyncmgrevents">IEnumSyncMgrEvents</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//syncmgr/nf-syncmgr-ienumsyncmgrevents-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumSyncMgrEvents(ppenum)
    }
}
