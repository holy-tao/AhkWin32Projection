#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFExtendedCameraControl.ahk" { IMFExtendedCameraControl }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMFExtendedCameraController interface allows apps to retrieve an instance of IMFExtendedCameraControl, which is used to configure a capture device's extended properties.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfextendedcameracontroller
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFExtendedCameraController extends IUnknown {
    /**
     * The interface identifier for IMFExtendedCameraController
     * @type {Guid}
     */
    static IID := Guid("{b91ebfee-ca03-4af4-8a82-a31752f4a0fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFExtendedCameraController interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExtendedCameraControl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFExtendedCameraController.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an instance of IMFExtendedCameraControl, which allows an app to get the current capture device's extended property controls.
     * @param {Integer} dwStreamIndex A **DWORD** indicating stream index to use for this property. Specify [MF_CAPTURE_ENGINE_MEDIASOURCE](/windows/win32/medfound/mf-capture-engine-mediasource-config) to indicate that the extended property is a filter-level property.
     * @param {Integer} ulPropertyId The ID indicating the index for identifying the property within [KSPROPERTYSETID_ExtendedCameraControl](/windows-hardware/drivers/stream/kspropertysetid-extendedcameracontrol
     * ).
     * @returns {IMFExtendedCameraControl} Receives a pointer to the **IMFExtendedCameraControl** instance that represents the requested control.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfextendedcameracontroller-getextendedcameracontrol
     */
    GetExtendedCameraControl(dwStreamIndex, ulPropertyId) {
        result := ComCall(3, this, "uint", dwStreamIndex, "uint", ulPropertyId, "ptr*", &ppControl := 0, "HRESULT")
        return IMFExtendedCameraControl(ppControl)
    }

    Query(iid) {
        if (IMFExtendedCameraController.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExtendedCameraControl := CallbackCreate(GetMethod(implObj, "GetExtendedCameraControl"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExtendedCameraControl)
    }
}
