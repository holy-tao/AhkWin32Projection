#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Reports that there was a failure in a resource instance. The PSIGNAL_FAILURE_ROUTINE type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-psignal_failure_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PSIGNAL_FAILURE_ROUTINE extends IUnknown {

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
     * @param {Pointer} ResourceHandle 
     * @param {Integer} FailureType 
     * @param {Integer} ApplicationSpecificErrorCode 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceHandle, FailureType, ApplicationSpecificErrorCode) {
        result := ComCall(3, this, "ptr", ResourceHandle, "int", FailureType, "uint", ApplicationSpecificErrorCode, "uint")
        return result
    }
}
