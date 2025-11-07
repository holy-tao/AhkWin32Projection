#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRegisteredSyncProvider.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk

/**
 * Represents the information and properties needed to create an instance of a synchronization provider.
 * @remarks
 * 
 * This interface is created from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderregistration">ISyncProviderRegistration</a> interface and then subsequently registered.  It is the mechanism by which applications can set the context and UX properties for a synchronization provider by first retrieving the property store and then modifying it.
 * 
 * The properties that are set in  <b>ISyncProviderInfo</b> are written to the registration store by calling the <b>ISyncProviderInfo::Commit</b> method inherited from the <b>IPropertyStore</b> interface. For an example of this, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/overview-of-registering-a-synchronization-provider">Overview of Registering a Synchronization Provider</a>.
 * 
 * You can get and set the properties of a  synchronization provider by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderinfo-getsyncprovider">GetSyncProvider</a> method and manipulating the provider's <b>IPropertyStore</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncproviderinfo
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProviderInfo extends IPropertyStore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncProviderInfo
     * @type {Guid}
     */
    static IID => Guid("{1ee135de-88a4-4504-b0d0-f7920d7e5ba6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncProvider"]

    /**
     * 
     * @param {Integer} dwClsContext 
     * @returns {IRegisteredSyncProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderinfo-getsyncprovider
     */
    GetSyncProvider(dwClsContext) {
        result := ComCall(8, this, "uint", dwClsContext, "ptr*", &ppSyncProvider := 0, "HRESULT")
        return IRegisteredSyncProvider(ppSyncProvider)
    }
}
