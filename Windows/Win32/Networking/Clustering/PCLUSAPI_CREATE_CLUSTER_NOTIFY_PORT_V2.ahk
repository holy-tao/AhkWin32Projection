#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HCHANGE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CREATE_CLUSTER_NOTIFY_PORT_V2 extends IUnknown {

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
     * @param {HCHANGE} hChange_ 
     * @param {HCLUSTER} hCluster_ 
     * @param {Pointer<NOTIFY_FILTER_AND_TYPE>} Filters 
     * @param {Integer} dwFilterCount 
     * @param {Pointer} dwNotifyKey 
     * @returns {HCHANGE} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hChange_, hCluster_, Filters, dwFilterCount, dwNotifyKey) {
        hChange_ := hChange_ is Win32Handle ? NumGet(hChange_, "ptr") : hChange_
        hCluster_ := hCluster_ is Win32Handle ? NumGet(hCluster_, "ptr") : hCluster_

        result := ComCall(3, this, "ptr", hChange_, "ptr", hCluster_, "ptr", Filters, "uint", dwFilterCount, "ptr", dwNotifyKey, "ptr")
        resultHandle := HCHANGE({Value: result}, True)
        return resultHandle
    }
}
