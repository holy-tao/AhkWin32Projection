#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISyncProviderConfigUI.ahk" { ISyncProviderConfigUI }

/**
 * Represents the information and properties needed to create an instance of a synchronization provider configuration UI.
 * @remarks
 * You can get and set the properties of a  synchronization provider configuration UI by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-isyncproviderconfiguiinfo-getsyncproviderconfigui">GetSyncProviderConfigUI</a> method and manipulating the configuration UI's <b>IPropertyStore</b>.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-isyncproviderconfiguiinfo
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncProviderConfigUIInfo extends IPropertyStore {
    /**
     * The interface identifier for ISyncProviderConfigUIInfo
     * @type {Guid}
     */
    static IID := Guid("{214141ae-33d7-4d8d-8e37-f227e880ce50}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncProviderConfigUIInfo interfaces
    */
    struct Vtbl extends IPropertyStore.Vtbl {
        GetSyncProviderConfigUI : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncProviderConfigUIInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of a synchronization provider configuration UI.
     * @param {Integer} dwClsContext The context in which the code that manages the newly created object will run. The only context supported is <b>CLSCTX_INPROC_SERVER</b>.
     * @returns {ISyncProviderConfigUI} The instance of the synchronization provider configuration UI.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfiguiinfo-getsyncproviderconfigui
     */
    GetSyncProviderConfigUI(dwClsContext) {
        result := ComCall(8, this, "uint", dwClsContext, "ptr*", &ppSyncProviderConfigUI := 0, "HRESULT")
        return ISyncProviderConfigUI(ppSyncProviderConfigUI)
    }

    Query(iid) {
        if (ISyncProviderConfigUIInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSyncProviderConfigUI := CallbackCreate(GetMethod(implObj, "GetSyncProviderConfigUI"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSyncProviderConfigUI)
    }
}
