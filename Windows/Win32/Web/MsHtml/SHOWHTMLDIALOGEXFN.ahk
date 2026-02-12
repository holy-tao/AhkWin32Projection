#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class SHOWHTMLDIALOGEXFN extends IUnknown {

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
     * @param {HWND} hwndParent 
     * @param {IMoniker} pmk 
     * @param {Integer} dwDialogFlags 
     * @param {Pointer<VARIANT>} pvarArgIn 
     * @param {PWSTR} pchOptions 
     * @param {Pointer<VARIANT>} pvArgOut 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwndParent, pmk, dwDialogFlags, pvarArgIn, pchOptions, pvArgOut) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pchOptions := pchOptions is String ? StrPtr(pchOptions) : pchOptions

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pmk, "uint", dwDialogFlags, "ptr", pvarArgIn, "ptr", pchOptions, "ptr", pvArgOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
