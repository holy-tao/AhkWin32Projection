#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves status information for a rolling upgrade of the operating system on a cluster. PCLUSTER_UPGRADE_PROGRESS_CALLBACK type defines a pointer to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nc-clusapi-pcluster_upgrade_progress_callback
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSTER_UPGRADE_PROGRESS_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} pvCallbackArg 
     * @param {Integer} eUpgradePhase 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvCallbackArg, eUpgradePhase) {
        pvCallbackArgMarshal := pvCallbackArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvCallbackArgMarshal, pvCallbackArg, "int", eUpgradePhase, "int")
        return result
    }
}
