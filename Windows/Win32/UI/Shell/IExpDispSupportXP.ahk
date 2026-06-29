#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\CIE4ConnectionPoint.ahk" { CIE4ConnectionPoint }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\DISPPARAMS.ahk" { DISPPARAMS }
#Import "..\WindowsAndMessaging\MSG.ahk" { MSG }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Deprecated. Exposes methods that allow the retrieval of properties, translation of keyboard accelerators, and determination of a connection point for certain events. (IExpDispSupportXP)
 * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-iexpdispsupportxp
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IExpDispSupportXP extends IUnknown {
    /**
     * The interface identifier for IExpDispSupportXP
     * @type {Guid}
     */
    static IID := Guid("{2f0dd58c-f789-4f14-99fb-9293b3c9c212}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IExpDispSupportXP interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindCIE4ConnectionPoint : IntPtr
        OnTranslateAccelerator  : IntPtr
        OnInvoke                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IExpDispSupportXP.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Deprecated. Gets a connection point for browser events.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Specifies an interface ID.
     * @returns {CIE4ConnectionPoint} Type: <b>CIE4ConnectionPoint**</b>
     * 
     * Receives the address of pointer to connection point.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupportxp-findcie4connectionpoint
     */
    FindCIE4ConnectionPoint(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &ppccp := 0, "HRESULT")
        return CIE4ConnectionPoint(ppccp)
    }

    /**
     * Not implemented. (IExpDispSupportXP.OnTranslateAccelerator)
     * @param {Pointer<MSG>} pMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-msg">MSG</a>*</b>
     * 
     * Specifies a pointer to the MSG structure describing the keystroke to be processed.
     * @param {Integer} grfModifiers Type: <b>DWORD</b>
     * 
     * Specifies the flags describing the state of the Control, Alt, and Shift keys. The value of the flag can be any valid <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms683763(v=vs.85)">KEYMODIFIERS</a> enumeration values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns <b>E_NOTIMPL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupportxp-ontranslateaccelerator
     */
    OnTranslateAccelerator(pMsg, grfModifiers) {
        result := ComCall(4, this, MSG.Ptr, pMsg, "uint", grfModifiers, "HRESULT")
        return result
    }

    /**
     * Not implemented. (IExpDispSupportXP.OnInvoke)
     * @param {Integer} dispidMember Type: <b>DISPID</b>
     * 
     * Specifies a dispatch ID that identifies the member being invoked.
     * @param {Pointer<Guid>} iid Type: <b>REFIID</b>
     * 
     * Reserved. Must be IID_NULL.
     * @param {Integer} lcid Type: <b>LCID</b>
     * 
     * Specifies a locale ID providing a locale context in which to interpret arguments. Applications that do not support multiple national languages can ignore this parameter.
     * @param {Integer} wFlags Type: <b>WORD</b>
     * 
     * Specifies flags describing the context of the call.
     * @param {Pointer<DISPPARAMS>} pdispparams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a>*</b>
     * 
     * Specifies a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure containing an array of arguments, an array of argument DISPIDs for named arguments, and counts for the number of elements in the arrays.
     * @param {Pointer<VARIANT>} pVarResult Type: <b>VARIANT*</b>
     * 
     * Receives a pointer to the location where the result is to be stored, or <b>NULL</b> if the calling application expects no result. This argument is ignored if DISPATCH_PROPERTYPUT or DISPATCH_PROPERTYPUTREF is specified.
     * @param {Pointer<EXCEPINFO>} pexcepinfo Type: <b>EXCEPINFO*</b>
     * 
     * Receives a pointer to a structure that contains exception information. This structure should be filled in if DISP_E_EXCEPTION is returned. Can be <b>NULL</b>.
     * @param {Pointer<Integer>} puArgErr Type: <b>UINT*</b>
     * 
     * Receives the index within the <b>rgvarg</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-dispparams">DISPPARAMS</a> structure of the first argument that has an error.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/shdeprecated/nf-shdeprecated-iexpdispsupportxp-oninvoke
     */
    OnInvoke(dispidMember, iid, lcid, wFlags, pdispparams, pVarResult, pexcepinfo, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int", dispidMember, Guid.Ptr, iid, "uint", lcid, "ushort", wFlags, DISPPARAMS.Ptr, pdispparams, VARIANT.Ptr, pVarResult, EXCEPINFO.Ptr, pexcepinfo, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IExpDispSupportXP.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindCIE4ConnectionPoint := CallbackCreate(GetMethod(implObj, "FindCIE4ConnectionPoint"), flags, 3)
        this.vtbl.OnTranslateAccelerator := CallbackCreate(GetMethod(implObj, "OnTranslateAccelerator"), flags, 3)
        this.vtbl.OnInvoke := CallbackCreate(GetMethod(implObj, "OnInvoke"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindCIE4ConnectionPoint)
        CallbackFree(this.vtbl.OnTranslateAccelerator)
        CallbackFree(this.vtbl.OnInvoke)
    }
}
