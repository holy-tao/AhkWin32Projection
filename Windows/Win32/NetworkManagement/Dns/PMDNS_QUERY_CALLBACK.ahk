#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class PMDNS_QUERY_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} pQueryContext 
     * @param {Pointer<MDNS_QUERY_HANDLE>} pQueryHandle 
     * @param {Pointer<DNS_QUERY_RESULT>} pQueryResults 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pQueryContext, pQueryHandle, pQueryResults) {
        pQueryContextMarshal := pQueryContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pQueryContextMarshal, pQueryContext, "ptr", pQueryHandle, "ptr", pQueryResults)
    }
}
