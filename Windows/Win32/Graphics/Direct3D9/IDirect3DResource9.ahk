#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DDevice9.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirect3DResource9 interface to query and prepare resources.
 * @remarks
 * 
 * To create a texture resource, you can call one of the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture">IDirect3DDevice9::CreateCubeTexture</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">IDirect3DDevice9::CreateTexture</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture">IDirect3DDevice9::CreateVolumeTexture</a>
 * </li>
 * </ul>
 * To create a geometry-oriented resource, you can call one of the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createindexbuffer">IDirect3DDevice9::CreateIndexBuffer</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvertexbuffer">IDirect3DDevice9::CreateVertexBuffer</a>
 * </li>
 * </ul>
 * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
 * 
 * The LPDIRECT3DRESOURCE9 and PDIRECT3DRESOURCE9 types are defined as pointers to the <b>IDirect3DResource9</b> interface. 
 * 
 * 
 *     
 * 
 * 
 * ```
 * 
 *     typedef struct IDirect3DResource9 *LPDIRECT3DRESOURCE9, *PDIRECT3DRESOURCE9;
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dresource9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DResource9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DResource9
     * @type {Guid}
     */
    static IID => Guid("{05eec05d-8f7d-4362-b999-d1baf357c704}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "SetPrivateData", "GetPrivateData", "FreePrivateData", "SetPriority", "GetPriority", "PreLoad", "GetType"]

    /**
     * Retrieves the device associated with a resource.
     * @returns {IDirect3DDevice9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface to fill with the device pointer, if the query succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-getdevice
     */
    GetDevice() {
        result := ComCall(3, this, "ptr*", &ppDevice := 0, "HRESULT")
        return IDirect3DDevice9(ppDevice)
    }

    /**
     * Associates data with the resource that is intended for use by the application, not by Direct3D. Data is passed by value, and multiple sets of data can be associated with a single resource.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Reference to the globally unique identifier that identifies the private data to set.
     * @param {Pointer<Void>} pData Type: <b>const void*</b>
     * 
     * Pointer to a buffer that contains the data to be associated with the resource.
     * @param {Integer} SizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Size of the buffer at pData, in bytes.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Value that describes the type of data being passed, or indicates to the application that the data should be invalidated when the resource changes. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="_none_"></a><a id="_NONE_"></a>(none)
     * 
     * </td>
     * <td width="60%">
     * If no flags are specified, Direct3D allocates memory to hold the data within the buffer and copies the data into the new buffer. The buffer allocated by Direct3D is automatically freed, as appropriate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="D3DSPD_IUNKNOWN"></a><a id="d3dspd_iunknown"></a>D3DSPD_IUNKNOWN
     * 
     * </td>
     * <td width="60%">
     * The data at pData is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. 
     * SizeOfData must be set to the size of a pointer to IUnknown, that is, sizeof(IUnknown*). Direct3D automatically callsIUnknown through pData when the private data is destroyed. Private data will be destroyed by a subsequent call to <b>IDirect3DResource9::SetPrivateData</b> with the same GUID, a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dresource9-freeprivatedata">IDirect3DResource9::FreePrivateData</a>, or when the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> object is released. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-setprivatedata
     */
    SetPrivateData(refguid, pData, SizeOfData, Flags) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", refguid, pDataMarshal, pData, "uint", SizeOfData, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Copies the private data associated with the resource to a provided buffer.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * The globally unique identifier that identifies the private data to retrieve.
     * @param {Pointer<Void>} pData Type: <b>void*</b>
     * 
     * Pointer to a previously allocated buffer to fill with the requested private data if the call succeeds. The application calling this method is responsible for allocating and releasing this buffer. If this parameter is <b>NULL</b>, this method will return the buffer size in pSizeOfData.
     * @param {Pointer<Integer>} pSizeOfData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to the size of the buffer at pData, in bytes. If this value is less than the actual size of the private data (such as 0), the method sets this parameter to the required buffer size and the method returns D3DERR_MOREDATA.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_MOREDATA, D3DERR_NOTFOUND.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-getprivatedata
     */
    GetPrivateData(refguid, pData, pSizeOfData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        pSizeOfDataMarshal := pSizeOfData is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", refguid, pDataMarshal, pData, pSizeOfDataMarshal, pSizeOfData, "HRESULT")
        return result
    }

    /**
     * Frees the specified private data associated with this resource.
     * @param {Pointer<Guid>} refguid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Reference to the globally unique identifier that identifies the private data to free.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be one of the following: D3DERR_INVALIDCALL, D3DERR_NOTFOUND.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-freeprivatedata
     */
    FreePrivateData(refguid) {
        result := ComCall(6, this, "ptr", refguid, "HRESULT")
        return result
    }

    /**
     * Assigns the priority of a resource for scheduling purposes.
     * @param {Integer} PriorityNew Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Priority to assign to a resource.
     *         
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 9 for Windows Vista
     * 
     * The priority can be any DWORD value; Direct3D 9 for Windows Vista also supports any of these pre-defined values <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3d9-resource-priority">D3D9_RESOURCE_PRIORITY</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Returns the previous priority value for the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-setpriority
     */
    SetPriority(PriorityNew) {
        result := ComCall(7, this, "uint", PriorityNew, "uint")
        return result
    }

    /**
     * Retrieves the priority for this resource.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Returns a DWORD value, indicating the priority of the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-getpriority
     */
    GetPriority() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Preloads a managed resource.
     * @remarks
     * 
     * Calling this method indicates that the application will need this managed resource shortly. This method has no effect on nonmanaged resources.
     * 
     * <b>IDirect3DResource9::PreLoad</b> detects "thrashing" conditions where more resources are being used in each frame than can fit in video memory simultaneously. Under such circumstances <b>IDirect3DResource9::PreLoad</b> silently does nothing.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-preload
     */
    PreLoad() {
        ComCall(9, this)
    }

    /**
     * Returns the type of the resource.
     * @returns {Integer} Type: <b><a href="/windows/desktop/direct3d9/d3dresourcetype">D3DRESOURCETYPE</a></b>
     * 
     * Returns a member of the <a href="/windows/desktop/direct3d9/d3dresourcetype">D3DRESOURCETYPE</a> enumerated type, identifying the type of the resource.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dresource9-gettype
     */
    GetType() {
        result := ComCall(10, this, "int")
        return result
    }
}
