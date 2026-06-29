#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbEnvironmentPropertySet.ahk" { ITsSbEnvironmentPropertySet }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods and properties that contain information about the environment that hosts the target computer. This interface can be used to store information about a physical server that hosts virtual machines.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbenvironment
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbEnvironment extends IUnknown {
    /**
     * The interface identifier for ITsSbEnvironment
     * @type {Guid}
     */
    static IID := Guid("{8c87f7f7-bf51-4a5c-87bf-8e94fb6e2256}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbEnvironment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name                   : IntPtr
        get_ServerWeight           : IntPtr
        get_EnvironmentPropertySet : IntPtr
        put_EnvironmentPropertySet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbEnvironment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    ServerWeight {
        get => this.get_ServerWeight()
    }

    /**
     * @type {ITsSbEnvironmentPropertySet} 
     */
    EnvironmentPropertySet {
        get => this.get_EnvironmentPropertySet()
        set => this.put_EnvironmentPropertySet(value)
    }

    /**
     * Retrieves a value that indicates the name of the environment that hosts the target computer.
     * @remarks
     * This method returns a string that is not directly used by Remote Desktop Connection Broker (RD Connection Broker). RD Connection Broker passes this string to resource plug-ins.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_name
     */
    get_Name() {
        pVal := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves a value that indicates the server weight of the environment that hosts the target computer.
     * @remarks
     * Plug-ins can use the server weight to make load balancing decisions. This value is not used by Remote Desktop Connection Broker (RD Connection Broker).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_serverweight
     */
    get_ServerWeight() {
        result := ComCall(4, this, "uint*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves or specifies the property set for the environment that hosts the target computer. (Get)
     * @returns {ITsSbEnvironmentPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-get_environmentpropertyset
     */
    get_EnvironmentPropertySet() {
        result := ComCall(5, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbEnvironmentPropertySet(ppPropertySet)
    }

    /**
     * Retrieves or specifies the property set for the environment that hosts the target computer. (Put)
     * @param {ITsSbEnvironmentPropertySet} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbenvironment-put_environmentpropertyset
     */
    put_EnvironmentPropertySet(pVal) {
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbEnvironment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_ServerWeight := CallbackCreate(GetMethod(implObj, "get_ServerWeight"), flags, 2)
        this.vtbl.get_EnvironmentPropertySet := CallbackCreate(GetMethod(implObj, "get_EnvironmentPropertySet"), flags, 2)
        this.vtbl.put_EnvironmentPropertySet := CallbackCreate(GetMethod(implObj, "put_EnvironmentPropertySet"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_ServerWeight)
        CallbackFree(this.vtbl.get_EnvironmentPropertySet)
        CallbackFree(this.vtbl.put_EnvironmentPropertySet)
    }
}
