#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Extends the timeout for a call to a resource type control code. The PEXTEND_RES_TYPE_CONTROL_CALL type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pextend_res_type_control_call
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PEXTEND_RES_TYPE_CONTROL_CALL extends IUnknown {

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
     * @param {Integer} context_ 
     * @param {Integer} newTimeoutInMs 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, newTimeoutInMs) {
        result := ComCall(3, this, "int64", context_, "uint", newTimeoutInMs, "uint")
        return result
    }
}
