#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_PROVIDER_TYPE.ahk" { VDS_PROVIDER_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Registers providers with VDS.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsadmin
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsAdmin extends IUnknown {
    /**
     * The interface identifier for IVdsAdmin
     * @type {Guid}
     */
    static IID := Guid("{d188e97d-85aa-4d33-abc6-26299a10ffc1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsAdmin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterProvider   : IntPtr
        UnregisterProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsAdmin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers the specified hardware provider with VDS. Hardware providers call this method.
     * @remarks
     * If necessary, call 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdsadmin-unregisterprovider">UnregisterProvider</a> to remove a provider 
     *     before registering a new version.
     * 
     * An in-process provider calls this method from 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-dllregisterserver">DllRegisterServer</a>; whereas, an out-of-process 
     *     provider calls from the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-winmain">WinMain</a> 
     *     function.
     * 
     * Hardware providers must not stop running while VDS is running.
     * @param {Guid} providerId The GUID of the hardware provider.
     * @param {Guid} providerClsid The COM class identifier (Clsid) of the hardware provider.
     * @param {PWSTR} pwszName The name of the hardware provider as  a zero-terminated, human-readable string.
     * @param {VDS_PROVIDER_TYPE} type The provider types enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_provider_type">VDS_PROVIDER_TYPE</a>. 
     *      Use the <b>VDS_PT_HARDWARE</b> value to register a hardware provider with VDS.
     * @param {PWSTR} pwszMachineName The name of the computer on which the hardware provider executes; a null-terminated, human-readable string. 
     *      Use <b>NULL</b> to reference the current computer.
     * @param {PWSTR} pwszVersion The  version of the provider as a zero-terminated, human-readable string.
     * @param {Guid} guidVersionId The GUID for this version of the provider.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_ALREADY_REGISTERED</b></dt>
     * <dt>0x80042403L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>providerId</i> is already registered. Only one version of a provider can be 
     *        registered at any given time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsadmin-registerprovider
     */
    RegisterProvider(providerId, providerClsid, pwszName, type, pwszMachineName, pwszVersion, guidVersionId) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszMachineName := pwszMachineName is String ? StrPtr(pwszMachineName) : pwszMachineName
        pwszVersion := pwszVersion is String ? StrPtr(pwszVersion) : pwszVersion

        result := ComCall(3, this, Guid, providerId, Guid, providerClsid, "ptr", pwszName, VDS_PROVIDER_TYPE, type, "ptr", pwszMachineName, "ptr", pwszVersion, Guid, guidVersionId, "HRESULT")
        return result
    }

    /**
     * Removes VDS provider registration data. Hardware providers call this method.
     * @remarks
     * An in-process provider calls this method from the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-dllregisterserver">DllRegisterServer</a> function; whereas, an out-of-process 
     *     provider calls from the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-winmain">WinMain</a> 
     *     function.
     * @param {Guid} providerId The GUID of the provider.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsadmin-unregisterprovider
     */
    UnregisterProvider(providerId) {
        result := ComCall(4, this, Guid, providerId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsAdmin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterProvider := CallbackCreate(GetMethod(implObj, "RegisterProvider"), flags, 8)
        this.vtbl.UnregisterProvider := CallbackCreate(GetMethod(implObj, "UnregisterProvider"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterProvider)
        CallbackFree(this.vtbl.UnregisterProvider)
    }
}
