#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1DeviceContext2.ahk" { ID2D1DeviceContext2 }
#Import ".\ID2D1Device1.ahk" { ID2D1Device1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }
#Import ".\ID2D1Bitmap.ahk" { ID2D1Bitmap }

/**
 * Represents a resource domain whose objects and device contexts can be used together. This interface performs all the same functions as the existing ID2D1Device1 interface. It also enables the creation of ID2D1DeviceContext2 objects.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1device2
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device2 extends ID2D1Device1 {
    /**
     * The interface identifier for ID2D1Device2
     * @type {Guid}
     */
    static IID := Guid("{a44472e1-8dfb-4e60-8492-6e2861c9ca8b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device2 interfaces
    */
    struct Vtbl extends ID2D1Device1.Vtbl {
        CreateDeviceContext : IntPtr
        FlushDeviceContexts : IntPtr
        GetDxgiDevice       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new ID2D1DeviceContext2 from a Direct2D device.
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext2} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1devicecontext2">ID2D1DeviceContext2</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new device context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(12, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext2 := 0, "HRESULT")
        return ID2D1DeviceContext2(deviceContext2)
    }

    /**
     * Flush all device contexts that reference a given bitmap.
     * @param {ID2D1Bitmap} _bitmap Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap, created on this device, for which all referencing device contexts will be flushed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-flushdevicecontexts
     */
    FlushDeviceContexts(_bitmap) {
        ComCall(13, this, "ptr", _bitmap)
    }

    /**
     * Returns the DXGI device associated with this Direct2D device.
     * @returns {IDXGIDevice} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>**</b>
     * 
     * The DXGI device associated with this Direct2D device.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1device2-getdxgidevice
     */
    GetDxgiDevice() {
        result := ComCall(14, this, "ptr*", &dxgiDevice := 0, "HRESULT")
        return IDXGIDevice(dxgiDevice)
    }

    Query(iid) {
        if (ID2D1Device2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceContext := CallbackCreate(GetMethod(implObj, "CreateDeviceContext"), flags, 3)
        this.vtbl.FlushDeviceContexts := CallbackCreate(GetMethod(implObj, "FlushDeviceContexts"), flags, 2)
        this.vtbl.GetDxgiDevice := CallbackCreate(GetMethod(implObj, "GetDxgiDevice"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceContext)
        CallbackFree(this.vtbl.FlushDeviceContexts)
        CallbackFree(this.vtbl.GetDxgiDevice)
    }
}
