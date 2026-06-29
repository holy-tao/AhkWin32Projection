#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Security\SECURITY_ATTRIBUTES.ahk" { SECURITY_ATTRIBUTES }

/**
 * Represents a fence, an object used for synchronization of the CPU and one or more GPUs. (ID3D11Fence)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11Fence extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11Fence
     * @type {Guid}
     */
    static IID := Guid("{affde9d1-1df7-4bb7-8a34-0f46251dab80}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11Fence interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        CreateSharedHandle   : IntPtr
        GetCompletedValue    : IntPtr
        SetEventOnCompletion : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11Fence.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a shared handle to a fence object.
     * @remarks
     * In order to to create a shared handle for the specified fence, the fence must have been created with either the <b>D3D11_FENCE_FLAG_SHARED</b> or <b>D3D11_FENCE_FLAG_SHARED_CROSS_ADAPTER</b> flags. For more information see the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag">D3D11_FENCE_FLAG</a> enumeration.
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that contains two separate but related data members: an optional security descriptor, and a <b>Boolean</b> value that determines whether child processes can inherit the returned handle.
     *             
     * 
     * Set this parameter to <b>NULL</b> if you want child processes that the
     *               application might create to not  inherit  the handle returned by
     *               <b>CreateSharedHandle</b>, and if you want the resource that is associated with the returned handle to get a default security
     *               descriptor.
     *             
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a
     *               <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> for the resource.
     *               Set this member to <b>NULL</b> if you want the runtime to assign a default security descriptor to the resource that is associated with the returned handle.
     *               The ACLs in the default security descriptor for the resource come from the primary or impersonation token of the creator.
     *               For more info, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} dwAccess Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Currently the only value this parameter accepts is GENERIC_ALL.
     * @param {PWSTR} lpName Type: <b>LPCWSTR</b>
     * 
     * A <b>NULL</b>-terminated <b>UNICODE</b> string that contains the name to associate with the shared heap.
     *               The name is limited to MAX_PATH characters.
     *               Name comparison is case-sensitive.
     *             
     * 
     * If <i>Name</i> matches the name of an existing resource, <b>CreateSharedHandle</b> fails with <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NAME_ALREADY_EXISTS</a>.
     *               This occurs because these objects share the same namespace.
     *             
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace.
     *               The remainder of the name can contain any character except the backslash character (\\).
     *               For more information, see
     *               <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>.
     *               Fast user switching is implemented using Terminal Services sessions.
     *               Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     *             
     * 
     * The object can be created in a private namespace.
     *               For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a>*</b>
     * 
     * A pointer to a variable that receives the NT HANDLE value to the resource to share.
     *             You can use this handle in calls to access the resource.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-createsharedhandle
     */
    CreateSharedHandle(pAttributes, dwAccess, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        pHandle := HANDLE.Owned()
        result := ComCall(7, this, SECURITY_ATTRIBUTES.Ptr, pAttributes, "uint", dwAccess, "ptr", lpName, HANDLE.Ptr, pHandle, "HRESULT")
        return pHandle
    }

    /**
     * Gets the current value of the fence. (ID3D11Fence.GetCompletedValue)
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Returns the current value of the fence.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-getcompletedvalue
     */
    GetCompletedValue() {
        result := ComCall(8, this, Int64)
        return result
    }

    /**
     * Specifies an event that should be fired when the fence reaches a certain value. (ID3D11Fence.SetEventOnCompletion)
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The fence value when the event is to be signaled.
     * @param {HANDLE} hEvent Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A handle to the event object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns <b>E_OUTOFMEMORY</b> if the kernel components don’t have sufficient memory to store the event in a list. See <a href="https://docs.microsoft.com/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/nf-d3d11_3-id3d11fence-seteventoncompletion
     */
    SetEventOnCompletion(Value, hEvent) {
        result := ComCall(9, this, "uint", Value, HANDLE, hEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11Fence.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSharedHandle := CallbackCreate(GetMethod(implObj, "CreateSharedHandle"), flags, 5)
        this.vtbl.GetCompletedValue := CallbackCreate(GetMethod(implObj, "GetCompletedValue"), flags, 1)
        this.vtbl.SetEventOnCompletion := CallbackCreate(GetMethod(implObj, "SetEventOnCompletion"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSharedHandle)
        CallbackFree(this.vtbl.GetCompletedValue)
        CallbackFree(this.vtbl.SetEventOnCompletion)
    }
}
