#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IMAPIControlIUnknown enables and disables a button control, and performs tasks when a user of a client application clicks the enabled control.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontroliunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIControl extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLastError", "Activate", "GetState"]

    /**
     * 
     * @remarks
     * Service providers implement the **IMAPIControl::GetLastError** method to supply information about a prior method call that failed. MAPI can give users detailed information about the error by displaying the data from the **MAPIERROR** structure in a message or dialog box.
     * @param {HRESULT} hResult > [in] A handle to the error value generated in the previous method call.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls the type of the strings returned. The following flag can be set:
     *     
     * MAPI_UNICODE 
     *   
     * > The strings in the **MAPIERROR** structure returned in the _lppMAPIError_ parameter are in Unicode format. If the MAPI_UNICODE flag is not set, the strings are in ANSI format.
     * @returns {Pointer<MAPIERROR>} > [out] A pointer to a pointer to a **MAPIERROR** structure that contains version, component, and context information for the error. The  _lppMAPIError_ parameter can be set to NULL if the provider cannot supply a **MAPIERROR** structure with appropriate information.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontrol-getlasterror
     */
    GetLastError(hResult, ulFlags) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", &lppMAPIError := 0, "HRESULT")
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
}
