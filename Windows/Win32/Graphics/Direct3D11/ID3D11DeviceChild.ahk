#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D11Device.ahk" { ID3D11Device }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A device-child interface accesses data used by a device. (ID3D11DeviceChild)
 * @remarks
 * There are several types of device child interfaces, all of which inherit this interface. They include shaders, state objects, and input layouts.
 * 
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11devicechild
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11DeviceChild extends IUnknown {
    /**
     * The interface identifier for ID3D11DeviceChild
     * @type {Guid}
     */
    static IID := Guid("{1841e5c8-16b0-489b-bcc8-44cfb0d5deae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11DeviceChild interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice               : IntPtr
        GetPrivateData          : IntPtr
        SetPrivateData          : IntPtr
        SetPrivateDataInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11DeviceChild.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to the device that created this interface. (ID3D11DeviceChild.GetDevice)
     * @remarks
     * Any returned interfaces will have their reference count incremented by one, so be sure to call ::release() on the returned pointer(s) before they are freed or else you will have a memory leak.
     * @param {Pointer<ID3D11Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>**</b>
     * 
     * Address of a pointer to a device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-getdevice
     */
    GetDevice(ppDevice) {
        ComCall(3, this, ID3D11Device.Ptr, ppDevice)
    }

    /**
     * Get application-defined data from a device child. (ID3D11DeviceChild.GetPrivateData)
     * @remarks
     * The data stored in the device child is set by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedata">ID3D11DeviceChild::SetPrivateData</a>.
     *         
     * If the data returned is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, or one of its derivative classes, which was previously set by SetPrivateDataInterface, that interface will have its reference count incremented before the private data is returned.
     * 
     * <b>Windows Phone 8:
     *         </b> This API is supported.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a variable that on input contains the size, in bytes, of the buffer that <i>pData</i> points to, and on output contains the size, in bytes, of the amount of data that
     *            <b>GetPrivateData</b> retrieved.
     * @param {Integer} pData Type: <b>void*</b>
     * 
     * A pointer to a buffer that
     *            <b>GetPrivateData</b> fills with data from the device child if <i>pDataSize</i> points to a value that specifies a buffer large enough to hold the data.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the 
     *             <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set application-defined data to a device child and associate that data with an application-defined guid. (ID3D11DeviceChild.SetPrivateData)
     * @remarks
     * The data stored in the device child with this method can be retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicechild-getprivatedata">ID3D11DeviceChild::GetPrivateData</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">debug layer</a> reports memory leaks by outputting a list of object interface pointers along with their friendly names. The default friendly name is "&lt;unnamed&gt;". You can set the friendly name so that you can determine if the corresponding object interface pointer caused the leak. To set the friendly name, use the <b>SetPrivateData</b> method and the <b>WKPDID_D3DDebugObjectName</b> GUID that is in D3Dcommon.h. For example, to give pContext a friendly name of <i>My name</i>, use the following code:
     * 
     * 
     * ```
     * 
     * static const char c_szName[] = "My name";
     * hr = pContext->SetPrivateData( WKPDID_D3DDebugObjectName, sizeof( c_szName ) - 1, c_szName );
     * 
     * ```
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the data.
     * @param {Integer} pData Type: <b>const void*</b>
     * 
     * Pointer to the data to be stored with this device child. If pData is <b>NULL</b>, DataSize must also be 0, and any data previously associated with the specified guid will be destroyed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(5, this, Guid.Ptr, guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid. (ID3D11DeviceChild.SetPrivateDataInterface)
     * @remarks
     * When this method is called ::addref() will be called on the IUnknown-derived interface, and when the device child is destroyed ::release() will be called on the IUnknown-derived interface.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the interface.
     * @param {IUnknown} pData Type: <b>const IUnknown*</b>
     * 
     * Pointer to an IUnknown-derived interface to be associated with the device child.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(6, this, Guid.Ptr, guid, "ptr", pData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11DeviceChild.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetPrivateData := CallbackCreate(GetMethod(implObj, "GetPrivateData"), flags, 4)
        this.vtbl.SetPrivateData := CallbackCreate(GetMethod(implObj, "SetPrivateData"), flags, 4)
        this.vtbl.SetPrivateDataInterface := CallbackCreate(GetMethod(implObj, "SetPrivateDataInterface"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetPrivateData)
        CallbackFree(this.vtbl.SetPrivateData)
        CallbackFree(this.vtbl.SetPrivateDataInterface)
    }
}
