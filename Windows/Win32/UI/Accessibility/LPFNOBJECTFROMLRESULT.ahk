#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class LPFNOBJECTFROMLRESULT extends IUnknown {

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
     * @param {LRESULT} lResult_ 
     * @param {Pointer<Guid>} riid 
     * @param {WPARAM} wParam_ 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lResult_, riid, wParam_, ppvObject) {
        lResult_ := lResult_ is Win32Handle ? NumGet(lResult_, "ptr") : lResult_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_

        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lResult_, "ptr", riid, "ptr", wParam_, ppvObjectMarshal, ppvObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
