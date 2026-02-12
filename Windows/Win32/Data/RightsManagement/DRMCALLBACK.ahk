#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Some of the functions included in the AD RMS SDK provide status information and licenses to your application by using a callback function that you must implement. The callback syntax is shown below.
 * @remarks
 * The following asynchronous AD RMS functions use a callback function:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquireadvisories">DRMAcquireAdvisories</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/msdrmdefs/nc-msdrmdefs-drmcallback
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMCALLBACK extends IUnknown {

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
     * @param {Integer} param0 
     * @param {HRESULT} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Void>} param3 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", param0, "int", param1, param2Marshal, param2, param3Marshal, param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
