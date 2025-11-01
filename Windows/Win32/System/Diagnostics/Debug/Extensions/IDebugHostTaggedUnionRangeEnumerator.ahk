#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostTaggedUnionRangeEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostTaggedUnionRangeEnumerator
     * @type {Guid}
     */
    static IID => Guid("{f4a035c0-4ca0-4b6d-bfd2-b378a0dbfe4c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "GetNext", "GetCount"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pLow 
     * @param {Pointer<VARIANT>} pHigh 
     * @returns {HRESULT} 
     */
    GetNext(pLow, pHigh) {
        result := ComCall(4, this, "ptr", pLow, "ptr", pHigh, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(5, this, "uint*", pCount, "HRESULT")
        return result
    }
}
