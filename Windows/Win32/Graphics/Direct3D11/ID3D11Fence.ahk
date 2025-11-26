#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Represents a fence, an object used for synchronization of the CPU and one or more GPUs.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nn-d3d11_3-id3d11fence
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Fence extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Fence
     * @type {Guid}
     */
    static IID => Guid("{affde9d1-1df7-4bb7-8a34-0f46251dab80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSharedHandle", "GetCompletedValue", "SetEventOnCompletion"]

    /**
     * Creates a shared handle to a fence object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes Type: <b>const <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a>structure that contains two separate but related data members: an optional security descriptor, and a <b>Boolean</b>value that determines whether child processes can inherit the returned handle.
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
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11fence-createsharedhandle
     */
    CreateSharedHandle(pAttributes, dwAccess, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        pHandle := HANDLE()
        result := ComCall(7, this, "ptr", pAttributes, "uint", dwAccess, "ptr", lpName, "ptr", pHandle, "HRESULT")
        return pHandle
    }

    /**
     * Gets the current value of the fence.
     * @returns {Integer} Type: <b><a href="/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Returns the current value of the fence.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11fence-getcompletedvalue
     */
    GetCompletedValue() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Specifies an event that should be fired when the fence reaches a certain value.
     * @param {Integer} Value Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The fence value when the event is to be signaled.
     * @param {HANDLE} hEvent Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * A handle to the event object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns <b>E_OUTOFMEMORY</b> if the kernel components don’t have sufficient memory to store the event in a list. See <a href="/windows/win32/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/nf-d3d11_3-id3d11fence-seteventoncompletion
     */
    SetEventOnCompletion(Value, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(9, this, "uint", Value, "ptr", hEvent, "HRESULT")
        return result
    }
}
