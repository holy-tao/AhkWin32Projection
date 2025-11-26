#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGISurface2.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDXGIResource.ahk

/**
 * An IDXGIResource1 interface extends the IDXGIResource interface by adding support for creating a subresource surface object and for creating a handle to a shared resource.
 * @remarks
 * 
 * To determine the type of memory a resource is currently located in, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">IDXGIDevice::QueryResourceResidency</a>. 
 *           To share resources between processes, use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1">ID3D11Device1::OpenSharedResource1</a>. 
 *           For information about how to share resources between multiple Windows graphics APIs, including Direct3D 11, Direct2D, Direct3D 10, and Direct3D 9Ex, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/surface-sharing-between-windows-graphics-apis">Surface Sharing Between Windows Graphics APIs</a>.
 *         
 * 
 * You can retrieve the <b>IDXGIResource1</b> interface from any video memory resource that you create from a Direct3D 10 and later function. Any Direct3D object that supports <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10resource">ID3D10Resource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> also supports <b>IDXGIResource1</b>. For example, the Direct3D 2D texture object that you create from <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> supports <b>IDXGIResource1</b>. You can call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the 2D texture object (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a>) to retrieve the <b>IDXGIResource1</b> interface. For example, to retrieve the <b>IDXGIResource1</b>  interface from  the 2D texture object, use the following code.
 *         
 * 
 * 
 * ```
 * IDXGIResource1 * pDXGIResource;
 * hr = g_pd3dTexture2D->QueryInterface(__uuidof(IDXGIResource1), (void **)&pDXGIResource);
 * ```
 * 
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgiresource1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIResource1 extends IDXGIResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIResource1
     * @type {Guid}
     */
    static IID => Guid("{30961379-4609-4a41-998e-54fe567ee0c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSubresourceSurface", "CreateSharedHandle"]

    /**
     * Creates a subresource surface object.
     * @param {Integer} index The index of the subresource surface object to enumerate.
     * @returns {IDXGISurface2} The address of a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgisurface2">IDXGISurface2</a> interface that represents the created subresource surface object at the position specified by the <i>index</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiresource1-createsubresourcesurface
     */
    CreateSubresourceSurface(index) {
        result := ComCall(12, this, "uint", index, "ptr*", &ppSurface := 0, "HRESULT")
        return IDXGISurface2(ppSurface)
    }

    /**
     * Creates a handle to a shared resource. You can then use the returned handle with multiple Direct3D devices.
     * @param {Pointer<SECURITY_ATTRIBUTES>} pAttributes A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> 
     *        structure that contains two separate but related data members: an optional security descriptor, and a Boolean 
     *        value that determines whether child processes can inherit the returned handle.
     * 
     * Set this parameter to <b>NULL</b> if you want child processes that the 
     *        application might create to not  inherit  the handle returned by 
     *        <b>CreateSharedHandle</b>, and if you want the resource that is associated with the returned handle to get a default security 
     *        descriptor.
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> for the resource. Set 
     *        this member to <b>NULL</b> if you want the runtime to assign a default security descriptor to the resource that is associated with the returned handle. The ACLs in the default security descriptor for the resource come from the primary or impersonation token of the creator. For more info, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-object-security-and-access-rights">Synchronization Object Security and Access Rights</a>.
     * @param {Integer} dwAccess The requested access rights to the resource.  In addition to the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">generic access rights</a>, DXGI defines the following values:
     * 
     * <ul>
     * <li><b>DXGI_SHARED_RESOURCE_READ</b> ( 0x80000000L ) - specifies read access to the resource.</li>
     * <li><b>DXGI_SHARED_RESOURCE_WRITE</b>	( 1 ) - specifies  write access to the resource.</li>
     * </ul>
     * You can combine these values by using a bitwise OR operation.
     * @param {PWSTR} lpName The name of the resource to share. The name is limited to MAX_PATH characters. Name comparison is case sensitive. 
     * 
     * You will need the resource name if you call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresourcebyname">ID3D11Device1::OpenSharedResourceByName</a> method to access the shared resource by name. If you instead call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11device1-opensharedresource1">ID3D11Device1::OpenSharedResource1</a> method to access the shared resource by handle, set this parameter to <b>NULL</b>.
     * 
     * If <i>lpName</i> matches the name of an existing resource, <b>CreateSharedHandle</b> fails with <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_NAME_ALREADY_EXISTS</a>. This occurs because these objects share the same namespace.
     * 
     * The name can have a "Global\" or "Local\" prefix to explicitly create the object in the global or session namespace. The remainder of the name can contain any character except the backslash character (\\). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/TermServ/kernel-object-namespaces">Kernel Object Namespaces</a>. Fast user switching is implemented using Terminal Services sessions. Kernel object names must follow the guidelines outlined for Terminal Services so that applications can support multiple users.
     * 
     * The object can be created in a private namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/object-namespaces">Object Namespaces</a>.
     * @returns {HANDLE} A pointer to a variable that receives the NT HANDLE value to the resource to share.  You can  use this handle in calls to access the resource.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle
     */
    CreateSharedHandle(pAttributes, dwAccess, lpName) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        pHandle := HANDLE()
        result := ComCall(13, this, "ptr", pAttributes, "uint", dwAccess, "ptr", lpName, "ptr", pHandle, "HRESULT")
        return pHandle
    }
}
