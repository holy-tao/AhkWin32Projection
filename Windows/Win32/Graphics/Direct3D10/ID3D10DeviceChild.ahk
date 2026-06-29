#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10Device.ahk" { ID3D10Device }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A device-child interface accesses data used by a device. (ID3D10DeviceChild)
 * @remarks
 * There are several types of device child interfaces, all of which inherit this interface. They include shaders, state objects, and input layouts.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10devicechild
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10DeviceChild extends IUnknown {
    /**
     * The interface identifier for ID3D10DeviceChild
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c00-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10DeviceChild interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice               : IntPtr
        GetPrivateData          : IntPtr
        SetPrivateData          : IntPtr
        SetPrivateDataInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10DeviceChild.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to the device that created this interface. (ID3D10DeviceChild.GetDevice)
     * @remarks
     * Any returned interfaces will have their reference count incremented by one, so be sure to call ::release() on the returned pointer(s) before they are freed or else you will have a memory leak.
     * @param {Pointer<ID3D10Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
     * 
     * Address of a pointer to a device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10devicechild-getdevice
     */
    GetDevice(ppDevice) {
        ComCall(3, this, ID3D10Device.Ptr, ppDevice)
    }

    /**
     * Get application-defined data from a device child. (ID3D10DeviceChild.GetPrivateData)
     * @remarks
     * The data stored in the device child is set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10devicechild-setprivatedata">ID3D10DeviceChild::SetPrivateData</a>.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * Size of the data.
     * @param {Integer} pData Type: <b>void*</b>
     * 
     * Pointer to the data stored with the device child. If pData is <b>NULL</b>, DataSize must also be 0, and any data previously associated with the guid will be destroyed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10devicechild-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, Guid.Ptr, guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set application-defined data to a device child and associate that data with an application-defined guid. (ID3D10DeviceChild.SetPrivateData)
     * @remarks
     * The data stored in the device child with this method can be retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10devicechild-getprivatedata">ID3D10DeviceChild::GetPrivateData</a>.
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
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10devicechild-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(5, this, Guid.Ptr, guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Associate an IUnknown-derived interface with this device child and associate that interface with an application-defined guid. (ID3D10DeviceChild.SetPrivateDataInterface)
     * @remarks
     * When this method is called ::addref() will be called on the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface, and when the device child is destroyed ::release() will be called on the IUnknown-derived interface.
     * @param {Pointer<Guid>} guid Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * Guid associated with the interface.
     * @param {IUnknown} pData Type: <b>const IUnknown*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>-derived interface to be associated with the device child.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10devicechild-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(6, this, Guid.Ptr, guid, "ptr", pData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D10DeviceChild.IID.Equals(iid)) {
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
