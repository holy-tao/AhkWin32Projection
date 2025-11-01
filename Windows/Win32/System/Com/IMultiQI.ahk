#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables a client to query an object proxy, or handler, for multiple interfaces by using a single RPC call.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imultiqi
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMultiQI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultiQI
     * @type {Guid}
     */
    static IID => Guid("{00000020-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryMultipleInterfaces"]

    /**
     * 
     * @param {Integer} cMQIs 
     * @param {Pointer<MULTI_QI>} pMQIs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imultiqi-querymultipleinterfaces
     */
    QueryMultipleInterfaces(cMQIs, pMQIs) {
        result := ComCall(3, this, "uint", cMQIs, "ptr", pMQIs, "HRESULT")
        return result
    }
}
