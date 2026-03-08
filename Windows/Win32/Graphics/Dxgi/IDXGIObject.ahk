#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An IDXGIObject interface is a base interface for all DXGI objects; IDXGIObject supports associating caller-defined (private data) with an object and retrieval of an interface to the parent object.
 * @remarks
 * <b>IDXGIObject</b> implements base-class functionality for the following interfaces:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>
 * </li>
 * </ul>
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiobject
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIObject
     * @type {Guid}
     */
    static IID => Guid("{aec22fb8-76f3-4639-9be0-28eb43a67a2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrivateData", "SetPrivateDataInterface", "GetPrivateData", "GetParent"]

    /**
     * Sets application-defined data to the object and associates that data with a GUID.
     * @remarks
     * <b>SetPrivateData</b> makes a copy of the specified data and stores it with the object.
     * 
     * Private data that <b>SetPrivateData</b> stores in the object occupies the same storage space as private data that is stored by associated Direct3D objects (for example, by a Microsoft Direct3D 11 device through <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-setprivatedata">ID3D11Device::SetPrivateData</a> or by a Direct3D 11 child device through <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedata">ID3D11DeviceChild::SetPrivateData</a>).
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> reports memory leaks by outputting a list of object interface pointers along with their friendly names. The default friendly name is "&lt;unnamed&gt;". You can set the friendly name so that you can determine if the corresponding object interface pointer caused the leak. To set the friendly name, use the <b>SetPrivateData</b> method and the well-known private data GUID (<b>WKPDID_D3DDebugObjectName</b>) that is in D3Dcommon.h. For example, to give pContext a friendly name of <i>My name</i>, use the following code:
     * 
     * 
     * ```
     * 
     * static const char c_szName[] = "My name";
     * hr = pContext->SetPrivateData( WKPDID_D3DDebugObjectName, sizeof( c_szName ) - 1, c_szName );
     * 
     * ```
     * 
     * 
     * You can use <b>WKPDID_D3DDebugObjectName</b> to track down memory leaks and understand performance characteristics of your applications. This information is reflected in the output of the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> that is related to memory leaks (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11debug-reportlivedeviceobjects">ID3D11Debug::ReportLiveDeviceObjects</a>) and with the <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-1-features">event tracing</a> for Windows events that we've added to Windows 8.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID that identifies the data. Use this GUID in a call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getprivatedata">GetPrivateData</a> to get the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the object's data.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * A pointer to the object's data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-setprivatedata
     */
    SetPrivateData(Name, DataSize, pData) {
        result := ComCall(3, this, "ptr", Name, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set an interface in the object's private data.
     * @remarks
     * This API associates an interface pointer with the object.
     * 
     * When the interface is set its reference count is incremented. When the data are overwritten (by calling SPD or SPDI with the same GUID) or the object is destroyed, ::Release() is called and the interface's reference count is decremented.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID identifying the interface.
     * @param {IUnknown} pUnknown Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The interface to set.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-setprivatedatainterface
     */
    SetPrivateDataInterface(Name, pUnknown) {
        result := ComCall(4, this, "ptr", Name, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Get a pointer to the object's data.
     * @remarks
     * If the data returned is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or one of its derivative classes, previously set by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-setprivatedatainterface">IDXGIObject::SetPrivateDataInterface</a>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">::Release()</a> on the pointer before the pointer is freed to decrement the reference count.
     * 
     * You can pass <b>GUID_DeviceType</b> in the <i>Name</i> parameter of <b>GetPrivateData</b> to retrieve the device type from the display adapter object (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter1">IDXGIAdapter1</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgiadapter2">IDXGIAdapter2</a>). 
     * 
     * <p class="proch"><b>To get the type of device on which the display adapter was created</b>
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a> object to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getparent">GetParent</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a> object to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object.</li>
     * <li>Call <b>GetPrivateData</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a> object with <b>GUID_DeviceType</b> to retrieve the type of device on which the display adapter was created. <i>pData</i> will point to a value from the driver-type enumeration (for example, a value from <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a>).</li>
     * </ol>
     * On Windows 7 or earlier, this type is either a value from <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE</a> depending on which kind of device was created. On Windows 8, this type is always a value from <b>D3D_DRIVER_TYPE</b>. Don't use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-setprivatedata">IDXGIObject::SetPrivateData</a> with <b>GUID_DeviceType</b> because the behavior when doing so is undefined.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID identifying the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The size of the data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Pointer to the data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getprivatedata
     */
    GetPrivateData(Name, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", Name, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the parent of the object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The ID of the requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the parent object.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getparent
     */
    GetParent(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppParent := 0, "HRESULT")
        return ppParent
    }
}
