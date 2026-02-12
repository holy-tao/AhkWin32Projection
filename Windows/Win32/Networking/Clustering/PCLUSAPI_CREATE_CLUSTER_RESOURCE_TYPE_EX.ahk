#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSAPI_CREATE_CLUSTER_RESOURCE_TYPE_EX extends IUnknown {

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
     * @param {HCLUSTER} hCluster_ 
     * @param {PWSTR} lpszResourceTypeName 
     * @param {PWSTR} lpszDisplayName 
     * @param {PWSTR} lpszResourceTypeDll 
     * @param {Integer} dwLooksAlivePollInterval 
     * @param {Integer} dwIsAlivePollInterval 
     * @param {PWSTR} lpszReason 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hCluster_, lpszResourceTypeName, lpszDisplayName, lpszResourceTypeDll, dwLooksAlivePollInterval, dwIsAlivePollInterval, lpszReason) {
        hCluster_ := hCluster_ is Win32Handle ? NumGet(hCluster_, "ptr") : hCluster_
        lpszResourceTypeName := lpszResourceTypeName is String ? StrPtr(lpszResourceTypeName) : lpszResourceTypeName
        lpszDisplayName := lpszDisplayName is String ? StrPtr(lpszDisplayName) : lpszDisplayName
        lpszResourceTypeDll := lpszResourceTypeDll is String ? StrPtr(lpszResourceTypeDll) : lpszResourceTypeDll
        lpszReason := lpszReason is String ? StrPtr(lpszReason) : lpszReason

        result := ComCall(3, this, "ptr", hCluster_, "ptr", lpszResourceTypeName, "ptr", lpszDisplayName, "ptr", lpszResourceTypeDll, "uint", dwLooksAlivePollInterval, "uint", dwIsAlivePollInterval, "ptr", lpszReason, "uint")
        return result
    }
}
