#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class PF_NPAddConnection4 extends IUnknown {

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
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer} lpAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hwndOwner, lpNetResource, lpAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "uint")
        return result
    }
}
