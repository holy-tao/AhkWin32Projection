#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IJsEnumDebugProperty extends IUnknown{
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
     * 
     * @param {Integer} count 
     * @param {Pointer<IJsDebugProperty>} ppDebugProperty 
     * @param {Pointer<UInt32>} pActualCount 
     * @returns {HRESULT} 
     */
    Next(count, ppDebugProperty, pActualCount) {
        result := ComCall(3, this, "uint", count, "ptr", ppDebugProperty, "uint*", pActualCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(4, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
