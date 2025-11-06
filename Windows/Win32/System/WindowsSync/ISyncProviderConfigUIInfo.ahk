#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncProviderConfigUI.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk

/**
 * Represents the information and properties needed to create an instance of a synchronization provider configuration UI.
 * @remarks
 * 
  * You can get and set the properties of a  synchronization provider configuration UI by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderconfiguiinfo-getsyncproviderconfigui">GetSyncProviderConfigUI</a>method and manipulating the configuration UI's <b>IPropertyStore</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncproviderconfiguiinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProviderConfigUIInfo extends IPropertyStore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncProviderConfigUIInfo
     * @type {Guid}
     */
    static IID => Guid("{214141ae-33d7-4d8d-8e37-f227e880ce50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncProviderConfigUI"]

    /**
     * 
     * @param {Integer} dwClsContext 
     * @returns {ISyncProviderConfigUI} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfiguiinfo-getsyncproviderconfigui
     */
    GetSyncProviderConfigUI(dwClsContext) {
        result := ComCall(8, this, "uint", dwClsContext, "ptr*", &ppSyncProviderConfigUI := 0, "HRESULT")
        return ISyncProviderConfigUI(ppSyncProviderConfigUI)
    }
}
