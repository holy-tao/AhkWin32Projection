#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumDebugExtendedPropertyInfo.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IEnumDebugExtendedPropertyInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDebugExtendedPropertyInfo
     * @type {Guid}
     */
    static IID => Guid("{51973c53-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<ExtendedDebugPropertyInfo>} rgExtendedPropertyInfo 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     */
    Next(celt, rgExtendedPropertyInfo, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgExtendedPropertyInfo, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumDebugExtendedPropertyInfo} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &pedpe := 0, "HRESULT")
        return IEnumDebugExtendedPropertyInfo(pedpe)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }
}
