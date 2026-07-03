#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Interface to pass requests from an application to the underlying Mobile Broadband miniport drivers.
 * @remarks
 * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnvendorspecificoperation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnVendorSpecificOperation extends IUnknown {
    /**
     * The interface identifier for IMbnVendorSpecificOperation
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2019-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnVendorSpecificOperation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetVendorSpecific : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnVendorSpecificOperation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends a request to the underlying Mobile Broadband device miniport driver.
     * @remarks
     * <b>SetVendorSpecific</b> exists to implement vendor-specific functionality which is not otherwise covered in the Mobile Broadband API.
     * 
     * The Mobile Broadband service will issue a SET OID request to the underlying miniport driver for OID_WWAN_VENDOR_SPECIFIC OID.  <i>VendorspecificData</i> will be copied byte by byte into the data buffer passed in the OID request.
     * 
     * This is an asynchronous operation and <b>SetVendorSpecific</b> will return immediately.  On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnvendorspecificevents-onsetvendorspecificcomplete">OnSetVendorSpecificComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnvendorspecificevents">IMbnVendorSpecificEvents</a> interface.
     * 
     * Refer to  the Mobile Broadband Driver Model for more information about vendor specific operations.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array that is passed in to the miniport driver.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnvendorspecificoperation-setvendorspecific
     */
    SetVendorSpecific(vendorSpecificData) {
        result := ComCall(3, this, SAFEARRAY.Ptr, vendorSpecificData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    Query(iid) {
        if (IMbnVendorSpecificOperation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetVendorSpecific := CallbackCreate(GetMethod(implObj, "SetVendorSpecific"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetVendorSpecific)
    }
}
