#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PSET_RESOURCE_STATUS_ROUTINE_EX callback function is called to update the status of a resource. (PSET_RESOURCE_STATUS_ROUTINE_EX)
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pset_resource_status_routine_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PSET_RESOURCE_STATUS_ROUTINE_EX extends IUnknown {

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
     * @param {Pointer<RESOURCE_STATUS_EX>} ResourceStatus 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceHandle, ResourceStatus) {
        result := ComCall(3, this, "ptr", ResourceHandle, "ptr", ResourceStatus, "uint")
        return result
    }
}
