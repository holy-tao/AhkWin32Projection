#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumSyncProviderConfigUIInfos.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates ISyncProviderConfigUIInfo objects that contain configuration UI information used to build and register a synchronization provider.
 * @remarks
 * 
  * This interface is obtained from the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317197(v=vs.85)">ISyncProviderRegistration::EnumerateSyncProviderConfigUIsForContentType</a> method. The method will return an  <b>IEnumSyncProviderConfigUIInfos</b> enumerator for all registered <b>ISyncProviderConfigUI</b> objects or for just the registered <b>ISyncProviderConfigUI</b> objects of a particular content type.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-ienumsyncproviderconfiguiinfos
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncProviderConfigUIInfos extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncProviderConfigUIInfos
     * @type {Guid}
     */
    static IID => Guid("{f6be2602-17c6-4658-a2d7-68ed3330f641}")

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
     * @param {Integer} cFactories 
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppSyncProviderConfigUIInfo 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-next
     */
    Next(cFactories, ppSyncProviderConfigUIInfo, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cFactories, "ptr*", ppSyncProviderConfigUIInfo, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cFactories 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-skip
     */
    Skip(cFactories) {
        result := ComCall(4, this, "uint", cFactories, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSyncProviderConfigUIInfos} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-ienumsyncproviderconfiguiinfos-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncProviderConfigUIInfos(ppEnum)
    }
}
