#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * For a [DisplaySurface](/uwp/api/windows.devices.display.core.displaysurface) or a [DisplayFence](/uwp/api/windows.devices.display.core.displayfence) object, creates a shared handle that can be used for interop with Direct3D or other graphics APIs.
 * @remarks
 * The handle returned by **CreateSharedHandle** can be used in any function that requires an "NT handle" to a GPU surface or fence (depending on what object was passed), provided that the caller has been granted access. Here are some examples.
 * 
 * * Share surfaces and fences with Direct3D 12 using [ID3D12Device::OpenSharedHandle](../d3d12/nf-d3d12-id3d12device-opensharedhandle.md).
 * * Share surfaces with Direct3D 11 using [ID3D11Device1::OpenSharedResource](../d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1.md).
 * * Share fences with Direct3D 11 using [ID3D11Device5::OpenSharedFence](../d3d11_4/nf-d3d11_4-id3d11device5-opensharedfence.md).
 * 
 * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. The following object-sharing mechanisms are available.
 * 
 * * A child process created by the [CreateProcess](../processthreadsapi/nf-processthreadsapi-createprocessa.md) function can inherit a handle to a surface or fence object if the *pSecurityAttributes* parameter of **CreateSharedHandle** enables inheritance.
 * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
 * * A process can specify the name of the object in a call to the [OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) or [ID3D12Device::OpenSharedHandleByName](../d3d12/nf-d3d12-id3d12device-opensharedhandlebyname.md) function.
 * 
 * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
 * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaydeviceinterop-createsharedhandle
 * @namespace Windows.Win32.System.WinRT.Display
 * @version v4.0.30319
 */
class IDisplayDeviceInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayDeviceInterop
     * @type {Guid}
     */
    static IID => Guid("{64338358-366a-471b-bd56-dd8ef48e439b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSharedHandle", "OpenSharedHandle"]

    /**
     * For a [DisplaySurface](/uwp/api/windows.devices.display.core.displaysurface) or a [DisplayFence](/uwp/api/windows.devices.display.core.displayfence) object, creates a shared handle that can be used for interop with Direct3D or other graphics APIs.
     * @remarks
     * The handle returned by **CreateSharedHandle** can be used in any function that requires an "NT handle" to a GPU surface or fence (depending on what object was passed), provided that the caller has been granted access. Here are some examples.
     * 
     * * Share surfaces and fences with Direct3D 12 using [ID3D12Device::OpenSharedHandle](../d3d12/nf-d3d12-id3d12device-opensharedhandle.md).
     * * Share surfaces with Direct3D 11 using [ID3D11Device1::OpenSharedResource](../d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1.md).
     * * Share fences with Direct3D 11 using [ID3D11Device5::OpenSharedFence](../d3d11_4/nf-d3d11_4-id3d11device5-opensharedfence.md).
     * 
     * Multiple processes can have handles of the same object, enabling use of the object for interprocess synchronization or sharing. The following object-sharing mechanisms are available.
     * 
     * * A child process created by the [CreateProcess](../processthreadsapi/nf-processthreadsapi-createprocessa.md) function can inherit a handle to a surface or fence object if the *pSecurityAttributes* parameter of **CreateSharedHandle** enables inheritance.
     * * A process can specify the object handle in a call to the [DuplicateHandle](../handleapi/nf-handleapi-duplicatehandle.md) function to create a duplicate handle that can be used by another process.
     * * A process can specify the name of the object in a call to the [OpenSharedHandle](nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle.md) or [ID3D12Device::OpenSharedHandleByName](../d3d12/nf-d3d12-id3d12device-opensharedhandlebyname.md) function.
     * 
     * Use the [CloseHandle](../handleapi/nf-handleapi-closehandle.md) function to close the handle. The system closes the handle automatically when the process terminates. The object is destroyed when its last handle has been closed and its last interface reference has been released.
     * @param {IInspectable} pObject A pointer to the **IUnknown** interface of a [DisplaySurface](/uwp/api/windows.devices.display.core.displaysurface) or a [DisplayFence](/uwp/api/windows.devices.display.core.displayfence) object.
     * @param {Pointer<SECURITY_ATTRIBUTES>} pSecurityAttributes A pointer to a [SECURITY_ATTRIBUTES](/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)) structure that contains two separate but related data members: an optional security descriptor, and a Boolean value that determines whether child processes can inherit the returned handle.
     * 
     * Set this parameter to `nullptr` if you want child processes that the application might create to not inherit the handle returned by **CreateSharedHandle**, and if you want the resource that is associated with the returned handle to get a default security descriptor.
     * 
     * The *lpSecurityDescriptor* member of the structure specifies a [SECURITY_DESCRIPTOR](../winnt/ns-winnt-security_descriptor.md) for the resource. Set this member to `nullptr` if you want the runtime to assign a default security descriptor to the resource that is associated with the returned handle. The access control lists (ACLs) in the default security descriptor for the resource come from the primary or impersonation token of the creator. For more info, see [Synchronization object security and access rights](/windows/win32/sync/synchronization-object-security-and-access-rights).
     * @param {Integer} Access The requested access rights to the resource. In addition to the [Generic access rights](/windows/win32/secauthz/generic-access-rights), a surface can use these values.
     * 
     * - **DXGI_SHARED_RESOURCE_READ** (0x80000000L). Specifies read access to the resource.
     * - **DXGI_SHARED_RESOURCE_WRITE** (1). Specifies write access to the resource.
     * 
     * You can combine these values by using a bitwise OR operation.
     * 
     * If *pObject* is a fence, then you must use **GENERIC_ALL**.
     * @param {HSTRING} Name Type: **[LPCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * A null-terminated Unicode string that contains the name to associate with the shared heap. The name is limited to **MAX_PATH** characters. Name comparison is case-sensitive.
     * 
     * If *Name* matches the name of an existing resource, then **CreateSharedHandle** fails with [DXGI_ERROR_NAME_ALREADY_EXISTS](/windows/win32/direct3ddxgi/dxgi-error). This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (`\`). For more information, see [Kernel object namespaces](/windows/win32/termserv/kernel-object-namespaces). Fast user-switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.            
     * 
     * The object can be created in a private namespace. For more information, see [Object namespaces](/windows/win32/sync/object-namespaces).
     * @returns {HANDLE} A pointer to a **HANDLE** that receives that new shared handle.
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaydeviceinterop-createsharedhandle
     */
    CreateSharedHandle(pObject, pSecurityAttributes, Access, Name) {
        Name := Name is Win32Handle ? NumGet(Name, "ptr") : Name

        pHandle := HANDLE()
        result := ComCall(3, this, "ptr", pObject, "ptr", pSecurityAttributes, "uint", Access, "ptr", Name, "ptr", pHandle, "HRESULT")
        return pHandle
    }

    /**
     * Opens a handle for shared primary surfaces, shared fences, and source presentation handles.
     * @remarks
     * You can use this method to open any shared fence, but you can open a surface only if it was created as primary. Primary surfaces are surfaces intended to be used directly by the display hardware to scan out. Most typical Direct3D surfaces are not created as primaries unless they were created for use in a swap-chain back buffer. [DisplayDevice.CreatePrimary](/uwp/api/windows.devices.display.core.displaydevice.createprimary) always creates a surface as a primary, since it is always intended to be used to scan out.
     * 
     * Opening a source presentation handle is similar to calling [CreateScanoutSource](/uwp/api/windows.devices.display.core.displaydevice.createscanoutsource) for the target of the presentation handle, except that it isn't necessary to have created the [DisplayDevice](/uwp/api/windows.devices.display.core.displaydevice) from the same [DisplayManager](/uwp/api/windows.devices.display.core.displaymanager) that created the handle. This allows fine-grained access control of scanout.
     * @param {HANDLE} NTHandle Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An NT handle for a shared primary surface, shared fence, or source presentation handle.
     * @param {Guid} riid Type: **REFIID**
     * 
     * A reference to the interface identifier (IID) for the default interface of one of the following Windows Runtime classes. An IID is a **[GUID](../guiddef/ns-guiddef-guid.md)**.
     * 
     * * [IDisplaySurface](/uwp/api/windows.devices.display.core.displaysurface)
     * * [IDisplayFence](/uwp/api/windows.devices.display.core.displayfence)
     * * [IDisplaySource](/uwp/api/windows.devices.display.core.displaysource)
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the interface specified by the *riid* argument.
     * @see https://learn.microsoft.com/windows/win32/api/windows.devices.display.core.interop/nf-windows-devices-display-core-interop-idisplaydeviceinterop-opensharedhandle
     */
    OpenSharedHandle(NTHandle, riid) {
        NTHandle := NTHandle is Win32Handle ? NumGet(NTHandle, "ptr") : NTHandle

        result := ComCall(4, this, "ptr", NTHandle, "ptr", riid, "ptr*", &ppvObj := 0, "HRESULT")
        return ppvObj
    }
}
