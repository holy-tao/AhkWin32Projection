#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a registered synchronization provider. This interface is implemented by the writer of a synchronization provider.
 * @remarks
 * If the registered synchronization provider is a <a href="https://www.microsoft.com/downloads/details.aspx?familyid=A3EE7BC5-A823-4FB4-B152-9E8CE9D5546F&displaylang=en">Microsoft Sync Framework</a> provider, then the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-init">Init</a> method will be called by the Sync Framework synchronization session. For more information about the different types of synchronization providers you can write for Windows, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/options-for-building-a-synchronization-provider">Options for Building a Synchronization Provider</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-iregisteredsyncprovider
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IRegisteredSyncProvider extends IUnknown {
    /**
     * The interface identifier for IRegisteredSyncProvider
     * @type {Guid}
     */
    static IID := Guid("{913bcf76-47c1-40b5-a896-5e8a9c414c14}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegisteredSyncProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init          : IntPtr
        GetInstanceId : IntPtr
        Reset         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegisteredSyncProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the synchronization provider before it is ready for a synchronization session.
     * @param {Pointer<Guid>} pguidInstanceId The instance ID of the synchronization provider.
     * @param {Pointer<Guid>} pguidContentType A GUID that represents the content type that this provider will synchronize.
     * @param {IPropertyStore} pContextPropertyStore The properties needed to initialize the synchronization provider. These properties are also provided when the synchronization provider is registered.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-init
     */
    Init(pguidInstanceId, pguidContentType, pContextPropertyStore) {
        result := ComCall(3, this, Guid.Ptr, pguidInstanceId, Guid.Ptr, pguidContentType, "ptr", pContextPropertyStore, "HRESULT")
        return result
    }

    /**
     * Returns the synchronization provider's instance ID.
     * @returns {Guid} The instance ID of the synchronization provider.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-getinstanceid
     */
    GetInstanceId() {
        pguidInstanceId := Guid()
        result := ComCall(4, this, Guid.Ptr, pguidInstanceId, "HRESULT")
        return pguidInstanceId
    }

    /**
     * Resets a synchronization provider so that it looks like a new replica in the next synchronization session.
     * @remarks
     * The writer of a synchronization provider may choose not to implement this method.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegisteredSyncProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 4)
        this.vtbl.GetInstanceId := CallbackCreate(GetMethod(implObj, "GetInstanceId"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.GetInstanceId)
        CallbackFree(this.vtbl.Reset)
    }
}
