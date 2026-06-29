#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MAPIERROR.ahk" { MAPIERROR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * IMAPIControlIUnknown enables and disables a button control, and performs tasks when a user of a client application clicks the enabled control.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontroliunknown
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct IMAPIControl extends IUnknown {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMAPIControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLastError : IntPtr
        Activate     : IntPtr
        GetState     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMAPIControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @remarks
     * Service providers implement the **IMAPIControl::GetLastError** method to supply information about a prior method call that failed. MAPI can give users detailed information about the error by displaying the data from the **MAPIERROR** structure in a message or dialog box.
     * @param {HRESULT} _hResult > [in] A handle to the error value generated in the previous method call.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the strings returned. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The strings in the **MAPIERROR** structure returned in the _lppMAPIError_ parameter are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @returns {Pointer<MAPIERROR>} > [out] A pointer to a pointer to a **MAPIERROR** structure that contains version, component, and context information for the error. The  _lppMAPIError_ parameter can be set to NULL if the provider cannot supply a **MAPIERROR** structure with appropriate information.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-getlasterror
     */
    GetLastError(_hResult, ulFlags) {
        result := ComCall(3, this, "int", _hResult, "uint", ulFlags, "ptr*", &lppMAPIError := 0, "HRESULT")
        return lppMAPIError
    }

    /**
     * 
     * @remarks
     * The **IMAPIControl::Activate** method performs tasks following a user's click of the button control. After the click occurs, as part of the processing of the display table, MAPI makes a call to **Activate** after first calling [IMAPIControl::GetState](imapicontrol-getstate.md) to determine whether the button is enabled. 
     *   
     * For more information about how to implement **Activate** and the other [IMAPIControl : IUnknown](imapicontroliunknown.md) methods, see [Control Object Implementation](control-object-implementation.md).
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer} ulUIParam > [in] A handle to the parent window of the dialog box on which the button control appears.
     * @returns {HRESULT} S_OK 
     *   
     * > The button control was successfully activated.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-activate
     */
    Activate(ulFlags, ulUIParam) {
        result := ComCall(4, this, "uint", ulFlags, "ptr", ulUIParam, "HRESULT")
        return result
    }

    /**
     * 
     * @remarks
     * Service providers implement the **IMAPIControl::GetState** method to provide MAPI with the state of a button control. If the button is enabled, it can respond to a mouse click or key press. If it is disabled, the button appears dimmed and does not respond to a mouse click or key press. 
     *   
     * For more information about how to implement **GetState** and the other [IMAPIControl : IUnknown](imapicontroliunknown.md) methods, see [Control Object Implementation](control-object-implementation.md).
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<Integer>} lpulState > [out] A pointer to a value that indicates the state of the button control. One of the following values can be returned:
     *     
     * MAPI_DISABLED 
     *   
     * > The button control is disabled and cannot be clicked. 
     *     
     * MAPI_ENABLED 
     *   
     * > The button control is enabled and can be clicked.
     * @returns {HRESULT} S_OK 
     *   
     * > The state of the button control was successfully retrieved.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-getstate
     */
    GetState(ulFlags, lpulState) {
        lpulStateMarshal := lpulState is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulFlags, lpulStateMarshal, lpulState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMAPIControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLastError := CallbackCreate(GetMethod(implObj, "GetLastError"), flags, 4)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 3)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLastError)
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.GetState)
    }
}
