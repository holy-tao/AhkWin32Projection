#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncProviderInfos.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates ISyncProviderInfo objects that contain the information used to create an instance of a synchronization provider.
 * @remarks
 * 
  * This interface is obtained from the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderregistration-enumeratesyncproviders">ISyncProviderRegistration::EnumerateSyncProviders</a> method. The method will return an  <b>IEnumSyncProviderInfos</b> enumerator for all registered <b>ISyncProviderInfo</b> objects or for just the registered <b>ISyncProviderInfo</b> objects that match the particular filter criteria.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-ienumsyncproviderinfos
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncProviderInfos extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncProviderInfos
     * @type {Guid}
     */
    static IID => Guid("{a04ba850-5eb1-460d-a973-393fcb608a11}")

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
     * 
     * @param {Integer} cInstances 
     * @param {Pointer<ISyncProviderInfo>} ppSyncProviderInfo 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderinfos-next
     */
    Next(cInstances, ppSyncProviderInfo, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cInstances, "ptr*", ppSyncProviderInfo, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cInstances 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderinfos-skip
     */
    Skip(cInstances) {
        result := ComCall(4, this, "uint", cInstances, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderinfos-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSyncProviderInfos} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderinfos-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncProviderInfos(ppEnum)
    }
}
