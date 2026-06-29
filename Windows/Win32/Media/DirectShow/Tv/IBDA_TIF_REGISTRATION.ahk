#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IPin.ahk" { IPin }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_TIF_REGISTRATION interface is exposed by the BDA Network Provider.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> 
 *      operator: <c>__uuidof(IBDA_TIF_REGISTRATION)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdatif/nn-bdatif-ibda_tif_registration
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IBDA_TIF_REGISTRATION extends IUnknown {
    /**
     * The interface identifier for IBDA_TIF_REGISTRATION
     * @type {Guid}
     */
    static IID := Guid("{dfef4a68-ee61-415f-9ccb-cd95f2f98a3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_TIF_REGISTRATION interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterTIFEx : IntPtr
        UnregisterTIF : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_TIF_REGISTRATION.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The RegisterTIFEx method registers a Transport Information Filter (TIF) with the Network Provider.
     * @param {IPin} pTIFInputPin Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface of the input pin on the TIF.
     * @param {Pointer<Integer>} ppvRegistrationContext Receives a token identifying the connection. Pass this token in the <b>UnregisterTIF</b> method when the TIF unregisters itself.
     * @param {Pointer<IUnknown>} ppMpeg2DataControl Receives a pointer to an <b>IUnknown</b> interface, which the TIF queries for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdaiface/nn-bdaiface-impeg2pidmap">IMPEG2PIDMap</a> interface. It uses the <b>IMPEG2PIDMap</b> to map and unmap PID values.
     * @returns {HRESULT} The method returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ibda_tif_registration-registertifex
     */
    RegisterTIFEx(pTIFInputPin, ppvRegistrationContext, ppMpeg2DataControl) {
        ppvRegistrationContextMarshal := ppvRegistrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pTIFInputPin, ppvRegistrationContextMarshal, ppvRegistrationContext, IUnknown.Ptr, ppMpeg2DataControl, "HRESULT")
        return result
    }

    /**
     * The UnregisterTIF method unregisters a Transport Information Filter (TIF) with the Network Provider.
     * @param {Integer} pvRegistrationContext Specifies the token that the <b>RegisterTIFEx</b> method returned in the <i>ppvRegistrationContext</i> parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-ibda_tif_registration-unregistertif
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_TIF_REGISTRATION.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterTIFEx := CallbackCreate(GetMethod(implObj, "RegisterTIFEx"), flags, 4)
        this.vtbl.UnregisterTIF := CallbackCreate(GetMethod(implObj, "UnregisterTIF"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterTIFEx)
        CallbackFree(this.vtbl.UnregisterTIF)
    }
}
