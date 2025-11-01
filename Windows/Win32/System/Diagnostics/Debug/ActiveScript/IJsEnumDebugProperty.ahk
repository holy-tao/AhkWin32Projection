#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsEnumDebugProperty extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJsEnumDebugProperty
     * @type {Guid}
     */
    static IID => Guid("{4092432f-2f0f-4fe1-b638-5b74a52cdcbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetCount"]

    /**
     * 
     * @param {Integer} count 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @param {Pointer<Integer>} pActualCount 
     * @returns {HRESULT} 
     */
    Next(count, ppDebugProperty, pActualCount) {
        result := ComCall(3, this, "uint", count, "ptr*", ppDebugProperty, "uint*", pActualCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(4, this, "uint*", pCount, "HRESULT")
        return result
    }
}
