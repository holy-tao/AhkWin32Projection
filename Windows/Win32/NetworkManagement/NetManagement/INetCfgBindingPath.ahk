#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import ".\IEnumNetCfgBindingInterface.ahk" { IEnumNetCfgBindingInterface }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfgBindingPath extends IUnknown {
    /**
     * The interface identifier for INetCfgBindingPath
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae96-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfgBindingPath interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsSamePathAs          : IntPtr
        IsSubPathOf           : IntPtr
        IsEnabled             : IntPtr
        Enable                : IntPtr
        GetPathToken          : IntPtr
        GetOwner              : IntPtr
        GetDepth              : IntPtr
        EnumBindingInterfaces : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfgBindingPath.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSamePathAs(pPath) {
        result := ComCall(3, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSubPathOf(pPath) {
        result := ComCall(4, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @param {BOOL} fEnable 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable(fEnable) {
        result := ComCall(6, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetPathToken() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszwPathToken := 0, "HRESULT")
        return ppszwPathToken
    }

    /**
     * 
     * @returns {INetCfgComponent} 
     */
    GetOwner() {
        result := ComCall(8, this, "ptr*", &ppComponent := 0, "HRESULT")
        return INetCfgComponent(ppComponent)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDepth() {
        result := ComCall(9, this, "uint*", &pcInterfaces := 0, "HRESULT")
        return pcInterfaces
    }

    /**
     * 
     * @returns {IEnumNetCfgBindingInterface} 
     */
    EnumBindingInterfaces() {
        result := ComCall(10, this, "ptr*", &ppenumInterface := 0, "HRESULT")
        return IEnumNetCfgBindingInterface(ppenumInterface)
    }

    Query(iid) {
        if (INetCfgBindingPath.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsSamePathAs := CallbackCreate(GetMethod(implObj, "IsSamePathAs"), flags, 2)
        this.vtbl.IsSubPathOf := CallbackCreate(GetMethod(implObj, "IsSubPathOf"), flags, 2)
        this.vtbl.IsEnabled := CallbackCreate(GetMethod(implObj, "IsEnabled"), flags, 1)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 2)
        this.vtbl.GetPathToken := CallbackCreate(GetMethod(implObj, "GetPathToken"), flags, 2)
        this.vtbl.GetOwner := CallbackCreate(GetMethod(implObj, "GetOwner"), flags, 2)
        this.vtbl.GetDepth := CallbackCreate(GetMethod(implObj, "GetDepth"), flags, 2)
        this.vtbl.EnumBindingInterfaces := CallbackCreate(GetMethod(implObj, "EnumBindingInterfaces"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsSamePathAs)
        CallbackFree(this.vtbl.IsSubPathOf)
        CallbackFree(this.vtbl.IsEnabled)
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.GetPathToken)
        CallbackFree(this.vtbl.GetOwner)
        CallbackFree(this.vtbl.GetDepth)
        CallbackFree(this.vtbl.EnumBindingInterfaces)
    }
}
