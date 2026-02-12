#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Describes the LPFNBUTTON function and provides syntax, parameters, return value, and additional remarks.
 * @remarks
 * Client applications call a callback function based on the **LPFNBUTTON** prototype to define a button in a details dialog box. The client passes a pointer to the callback function in calls to the [IAddrBook::Details](iaddrbook-details.md) method.
 *   
 * Service providers call a hook function based on the **LPFNBUTTON** prototype to define a button in a details dialog box. The provider passes a pointer to this hook function in calls to the [IMAPISupport::Details](imapisupport-details.md) method.
 *   
 * In both cases, when the dialog box is displayed and the user chooses the defined button, MAPI calls **LPFNBUTTON**.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/lpfnbutton
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class LPFNBUTTON extends IUnknown {

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
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer} ulUIParam 
     * @param {Pointer<Void>} lpvContext 
     * @param {Integer} cbEntryID 
     * @param {Pointer<ENTRYID>} lpSelection 
     * @param {Integer} ulFlags 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ulUIParam, lpvContext, cbEntryID, lpSelection, ulFlags) {
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", ulUIParam, lpvContextMarshal, lpvContext, "uint", cbEntryID, "ptr", lpSelection, "uint", ulFlags, "int")
        return result
    }
}
