#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemQualifier extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemQualifier
     * @type {Guid}
     */
    static IID => Guid("{79b05932-d3b7-11d1-8b06-00600806d9b6}")

    /**
     * The class identifier for SWbemQualifier
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5f-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Name", "get_IsLocal", "get_PropagatesToSubclass", "put_PropagatesToSubclass", "get_PropagatesToInstance", "put_PropagatesToInstance", "get_IsOverridable", "put_IsOverridable", "get_IsAmended"]

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    get_Value(varValue) {
        result := ComCall(7, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    get_Name(strName) {
        result := ComCall(9, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsLocal 
     * @returns {HRESULT} 
     */
    get_IsLocal(bIsLocal) {
        result := ComCall(10, this, "ptr", bIsLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bPropagatesToSubclass 
     * @returns {HRESULT} 
     */
    get_PropagatesToSubclass(bPropagatesToSubclass) {
        result := ComCall(11, this, "ptr", bPropagatesToSubclass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @returns {HRESULT} 
     */
    put_PropagatesToSubclass(bPropagatesToSubclass) {
        result := ComCall(12, this, "short", bPropagatesToSubclass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bPropagatesToInstance 
     * @returns {HRESULT} 
     */
    get_PropagatesToInstance(bPropagatesToInstance) {
        result := ComCall(13, this, "ptr", bPropagatesToInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @returns {HRESULT} 
     */
    put_PropagatesToInstance(bPropagatesToInstance) {
        result := ComCall(14, this, "short", bPropagatesToInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsOverridable 
     * @returns {HRESULT} 
     */
    get_IsOverridable(bIsOverridable) {
        result := ComCall(15, this, "ptr", bIsOverridable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @returns {HRESULT} 
     */
    put_IsOverridable(bIsOverridable) {
        result := ComCall(16, this, "short", bIsOverridable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsAmended 
     * @returns {HRESULT} 
     */
    get_IsAmended(bIsAmended) {
        result := ComCall(17, this, "ptr", bIsAmended, "HRESULT")
        return result
    }
}
