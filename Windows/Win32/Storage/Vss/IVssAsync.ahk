#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAsync interface is returned to calling applications by methods that initiate asynchronous operations, which run in the background and typically require a long time to complete.
 * @see https://docs.microsoft.com/windows/win32/api//vss/nn-vss-ivssasync
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssAsync
     * @type {Guid}
     */
    static IID => Guid("{507c37b4-cf5b-4e95-b0af-14eb9767467e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel", "Wait", "QueryStatus"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssasync-cancel
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssasync-wait
     */
    Wait(dwMilliseconds) {
        result := ComCall(4, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vss/nf-vss-ivssasync-querystatus
     */
    QueryStatus(pReserved) {
        pReservedMarshal := pReserved is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "int*", &pHrResult := 0, pReservedMarshal, pReserved, "HRESULT")
        return pHrResult
    }
}
