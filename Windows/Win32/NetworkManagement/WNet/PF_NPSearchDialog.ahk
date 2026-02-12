#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class PF_NPSearchDialog extends IUnknown {

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
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} lpnFlags 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwndParent, lpNetResource, lpBuffer, cbBuffer, lpnFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpnFlagsMarshal := lpnFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", hwndParent, "ptr", lpNetResource, lpBufferMarshal, lpBuffer, "uint", cbBuffer, lpnFlagsMarshal, lpnFlags, "uint")
        return result
    }
}
