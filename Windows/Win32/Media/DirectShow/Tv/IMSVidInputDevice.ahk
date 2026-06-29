#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDevice.ahk" { IMSVidDevice }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IMSVidInputDevice interface represents any input device that is recognized by the Video Control, such as a television tuner card.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidInputDevice)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidinputdevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidInputDevice extends IMSVidDevice {
    /**
     * The interface identifier for IMSVidInputDevice
     * @type {Guid}
     */
    static IID := Guid("{37b0353d-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidInputDevice
     * @type {Guid}
     */
    static CLSID := Guid("{ac1972f2-138a-4ca3-90da-ae51112eda28}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidInputDevice interfaces
    */
    struct Vtbl extends IMSVidDevice.Vtbl {
        IsViewable : IntPtr
        View       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidInputDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IsViewable method determines whether this device can view the specified tune request.
     * @param {Pointer<VARIANT>} v Specifies the tune request as a <b>VARIANT</b> type.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevice-isviewable
     */
    IsViewable(v) {
        result := ComCall(16, this, VARIANT.Ptr, v, VARIANT_BOOL.Ptr, &pfViewable := 0, "HRESULT")
        return pfViewable
    }

    /**
     * The View method configures this input device to view the specified tune request.
     * @remarks
     * Before calling this method, set the device as the active input by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-put_inputactive">IMSVidCtl::put_InputActive</a> method. Unless the application needs to choose a specific input device, however, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method is recommended instead of the <b>IMSVidInputDevice::View</b> method.
     * @param {Pointer<VARIANT>} v Specifies the tune request as a <b>VARIANT</b> type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevice-view
     */
    View(v) {
        result := ComCall(17, this, VARIANT.Ptr, v, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidInputDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsViewable := CallbackCreate(GetMethod(implObj, "IsViewable"), flags, 3)
        this.vtbl.View := CallbackCreate(GetMethod(implObj, "View"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsViewable)
        CallbackFree(this.vtbl.View)
    }
}
