#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides the settings that the Task Scheduler service uses to obtain a network profile.
 * @remarks
 * When reading or writing your own XML for a task, network settings are specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-networksettings-settingstype-element">NetworkSettings</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-inetworksettings
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct INetworkSettings extends IDispatch {
    /**
     * The interface identifier for INetworkSettings
     * @type {Guid}
     */
    static IID := Guid("{9f7dea84-c30b-4245-80b6-00e9f646f1b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetworkSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name : IntPtr
        put_Name : IntPtr
        get_Id   : IntPtr
        put_Id   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetworkSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the name of a network profile. (Get)
     * @param {Pointer<BSTR>} pName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-inetworksettings-get_name
     */
    get_Name(pName) {
        result := ComCall(7, this, BSTR.Ptr, pName, "HRESULT")
        return result
    }

    /**
     * Gets or sets the name of a network profile. (Put)
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-inetworksettings-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "HRESULT")
        return result
    }

    /**
     * Gets or sets a GUID value that identifies a network profile. (Get)
     * @param {Pointer<BSTR>} pId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-inetworksettings-get_id
     */
    get_Id(pId) {
        result := ComCall(9, this, BSTR.Ptr, pId, "HRESULT")
        return result
    }

    /**
     * Gets or sets a GUID value that identifies a network profile. (Put)
     * @param {BSTR} id 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-inetworksettings-put_id
     */
    put_Id(id) {
        id := id is String ? BSTR.Alloc(id).Value : id

        result := ComCall(10, this, BSTR, id, "HRESULT")
        return result
    }

    Query(iid) {
        if (INetworkSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.put_Id := CallbackCreate(GetMethod(implObj, "put_Id"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.put_Id)
    }
}
