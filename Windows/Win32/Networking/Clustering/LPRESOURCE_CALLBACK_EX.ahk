#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The LPRESOURCE_CALLBACK_EX callback function is accessible by another function and is invoked after the first function completes. (LPRESOURCE_CALLBACK_EX)
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-lpresource_callback_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class LPRESOURCE_CALLBACK_EX extends IUnknown {

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
     * @param {HCLUSTER} param0 
     * @param {HRESOURCE} param1 
     * @param {HRESOURCE} param2 
     * @param {Pointer<Void>} param3 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1
        param2 := param2 is Win32Handle ? NumGet(param2, "ptr") : param2

        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, param3Marshal, param3, "uint")
        return result
    }
}
