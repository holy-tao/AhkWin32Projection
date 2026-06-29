#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_PinControl interface is exposed on a BDA device filter's pins. A Network Provider calls these methods to determine the type and identifier of each pin on the filter. A Network Provider uses this information when building the graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_PinControl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_pincontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_PinControl extends IUnknown {
    /**
     * The interface identifier for IBDA_PinControl
     * @type {Guid}
     */
    static IID := Guid("{0ded49d5-a8b7-4d5d-97a1-12b0c195874d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_PinControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPinID            : IntPtr
        GetPinType          : IntPtr
        RegistrationContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_PinControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetPinID method retrieves the ID of the pin.
     * @param {Pointer<Integer>} pulPinID Pointer that receives the pin's identifier.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-getpinid
     */
    GetPinID(pulPinID) {
        pulPinIDMarshal := pulPinID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pulPinIDMarshal, pulPinID, "HRESULT")
        return result
    }

    /**
     * The GetPinType method retrieves the type of the pin.
     * @param {Pointer<Integer>} pulPinType Pointer that receives the pin type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-getpintype
     */
    GetPinType(pulPinType) {
        pulPinTypeMarshal := pulPinType is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pulPinTypeMarshal, pulPinType, "HRESULT")
        return result
    }

    /**
     * The RegistrationContext method retrieves the registration context of a particular pin.
     * @remarks
     * The registration context uniquely identifies an instance of a particular pin. A Network Provider does not modify this value; it simply retains it in order to keep track of the pins in the graph.
     * @param {Pointer<Integer>} pulRegistrationCtx Pointer that receives the registration context.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_pincontrol-registrationcontext
     */
    RegistrationContext(pulRegistrationCtx) {
        pulRegistrationCtxMarshal := pulRegistrationCtx is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pulRegistrationCtxMarshal, pulRegistrationCtx, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_PinControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPinID := CallbackCreate(GetMethod(implObj, "GetPinID"), flags, 2)
        this.vtbl.GetPinType := CallbackCreate(GetMethod(implObj, "GetPinType"), flags, 2)
        this.vtbl.RegistrationContext := CallbackCreate(GetMethod(implObj, "RegistrationContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPinID)
        CallbackFree(this.vtbl.GetPinType)
        CallbackFree(this.vtbl.RegistrationContext)
    }
}
