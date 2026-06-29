#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\Xps\Printing\IPrintDocumentPackageTarget.ahk" { IPrintDocumentPackageTarget }
#Import ".\D2D1_PRINT_CONTROL_PROPERTIES.ahk" { D2D1_PRINT_CONTROL_PROPERTIES }
#Import "..\Imaging\IWICImagingFactory.ahk" { IWICImagingFactory }
#Import ".\ID2D1PrintControl.ahk" { ID2D1PrintControl }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_DEVICE_CONTEXT_OPTIONS.ahk" { D2D1_DEVICE_CONTEXT_OPTIONS }
#Import ".\ID2D1DeviceContext.ahk" { ID2D1DeviceContext }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a resource domain whose objects and device contexts can be used together. (ID2D1Device)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1device
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Device extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Device
     * @type {Guid}
     */
    static IID := Guid("{47dd575d-ac05-4cdd-8049-9b02cd16f44c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Device interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        CreateDeviceContext     : IntPtr
        CreatePrintControl      : IntPtr
        SetMaximumTextureMemory : IntPtr
        GetMaximumTextureMemory : IntPtr
        ClearResources          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Device.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new device context from a Direct2D device.
     * @remarks
     * The new device context will not have a  selected target bitmap. The caller must create and select a bitmap as the target surface of the context.
     * @param {D2D1_DEVICE_CONTEXT_OPTIONS} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext} Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new device context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1device-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(4, this, D2D1_DEVICE_CONTEXT_OPTIONS, options, "ptr*", &deviceContext := 0, "HRESULT")
        return ID2D1DeviceContext(deviceContext)
    }

    /**
     * Creates an ID2D1PrintControl object that converts Direct2D primitives stored in ID2D1CommandList into a fixed page representation. The print sub-system then consumes the primitives.
     * @param {IWICImagingFactory} wicFactory 
     * @param {IPrintDocumentPackageTarget} documentTarget 
     * @param {Pointer<D2D1_PRINT_CONTROL_PROPERTIES>} printControlProperties 
     * @returns {ID2D1PrintControl} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1device-createprintcontrol
     */
    CreatePrintControl(wicFactory, documentTarget, printControlProperties) {
        result := ComCall(5, this, "ptr", wicFactory, "ptr", documentTarget, D2D1_PRINT_CONTROL_PROPERTIES.Ptr, printControlProperties, "ptr*", &printControl := 0, "HRESULT")
        return ID2D1PrintControl(printControl)
    }

    /**
     * Sets the maximum amount of texture memory Direct2D accumulates before it purges the image caches and cached texture allocations. (ID2D1Device.SetMaximumTextureMemory)
     * @remarks
     * <div class="alert"><b>Note</b>  Direct2D may exceed the  maximum texture memory you set with this method for a single frame if necessary to render the frame.</div>
     * <div> </div>
     * @param {Integer} maximumInBytes Type: <b>UINT64</b>
     * 
     * The new maximum texture memory in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1device-setmaximumtexturememory
     */
    SetMaximumTextureMemory(maximumInBytes) {
        ComCall(6, this, "uint", maximumInBytes)
    }

    /**
     * Sets the maximum amount of texture memory Direct2D accumulates before it purges the image caches and cached texture allocations. (ID2D1Device.GetMaximumTextureMemory)
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * The maximum amount of texture memory in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1device-getmaximumtexturememory
     */
    GetMaximumTextureMemory() {
        result := ComCall(7, this, Int64)
        return result
    }

    /**
     * Clears all of the rendering resources used by Direct2D.
     * @param {Integer} millisecondsSinceUse Type: <b>UINT</b>
     * 
     * Discards only resources that haven't been used for greater than the specified time in milliseconds. The default is 0 milliseconds.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1device-clearresources
     */
    ClearResources(millisecondsSinceUse) {
        ComCall(8, this, "uint", millisecondsSinceUse)
    }

    Query(iid) {
        if (ID2D1Device.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDeviceContext := CallbackCreate(GetMethod(implObj, "CreateDeviceContext"), flags, 3)
        this.vtbl.CreatePrintControl := CallbackCreate(GetMethod(implObj, "CreatePrintControl"), flags, 5)
        this.vtbl.SetMaximumTextureMemory := CallbackCreate(GetMethod(implObj, "SetMaximumTextureMemory"), flags, 2)
        this.vtbl.GetMaximumTextureMemory := CallbackCreate(GetMethod(implObj, "GetMaximumTextureMemory"), flags, 1)
        this.vtbl.ClearResources := CallbackCreate(GetMethod(implObj, "ClearResources"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDeviceContext)
        CallbackFree(this.vtbl.CreatePrintControl)
        CallbackFree(this.vtbl.SetMaximumTextureMemory)
        CallbackFree(this.vtbl.GetMaximumTextureMemory)
        CallbackFree(this.vtbl.ClearResources)
    }
}
