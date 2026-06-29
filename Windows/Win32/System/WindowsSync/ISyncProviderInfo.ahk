#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRegisteredSyncProvider.ahk" { IRegisteredSyncProvider }

/**
 * Represents the information and properties needed to create an instance of a synchronization provider.
 * @remarks
 * This interface is created from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderregistration">ISyncProviderRegistration</a> interface and then subsequently registered.  It is the mechanism by which applications can set the context and UX properties for a synchronization provider by first retrieving the property store and then modifying it.
 * 
 * The properties that are set in  <b>ISyncProviderInfo</b> are written to the registration store by calling the <b>ISyncProviderInfo::Commit</b> method inherited from the <b>IPropertyStore</b> interface. For an example of this, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/overview-of-registering-a-synchronization-provider">Overview of Registering a Synchronization Provider</a>.
 * 
 * You can get and set the properties of a  synchronization provider by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderinfo-getsyncprovider">GetSyncProvider</a> method and manipulating the provider's <b>IPropertyStore</b>.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-isyncproviderinfo
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncProviderInfo extends IPropertyStore {
    /**
     * The interface identifier for ISyncProviderInfo
     * @type {Guid}
     */
    static IID := Guid("{1ee135de-88a4-4504-b0d0-f7920d7e5ba6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncProviderInfo interfaces
    */
    struct Vtbl extends IPropertyStore.Vtbl {
        GetSyncProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncProviderInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the synchronization provider.
     * @param {Integer} dwClsContext The context in which the code that manages the newly created object will run. The only context supported is <b>CLSCTX_INPROC_SERVER</b>.
     * @returns {IRegisteredSyncProvider} The instance of the synchronization provider.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderinfo-getsyncprovider
     */
    GetSyncProvider(dwClsContext) {
        result := ComCall(8, this, "uint", dwClsContext, "ptr*", &ppSyncProvider := 0, "HRESULT")
        return IRegisteredSyncProvider(ppSyncProvider)
    }

    Query(iid) {
        if (ISyncProviderInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncProvider := CallbackCreate(GetMethod(implObj, "GetSyncProvider"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncProvider)
    }
}
