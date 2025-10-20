#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cFactories 
     * @param {Pointer<ISyncProviderConfigUIInfo>} ppSyncProviderConfigUIInfo 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cFactories, ppSyncProviderConfigUIInfo, pcFetched) {
        result := ComCall(3, this, "uint", cFactories, "ptr", ppSyncProviderConfigUIInfo, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cFactories 
     * @returns {HRESULT} 
     */
    Skip(cFactories) {
        result := ComCall(4, this, "uint", cFactories, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumSyncProviderConfigUIInfos>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
