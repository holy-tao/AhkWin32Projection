#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PropagatesToSubclass {
        get => this.get_PropagatesToSubclass()
        set => this.put_PropagatesToSubclass(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PropagatesToInstance {
        get => this.get_PropagatesToInstance()
        set => this.put_PropagatesToInstance(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsOverridable {
        get => this.get_IsOverridable()
        set => this.put_IsOverridable(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsAmended {
        get => this.get_IsAmended()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        varValue := VARIANT()
        result := ComCall(7, this, "ptr", varValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return varValue
    }

    /**
     * 
     * @param {Pointer<VARIANT>} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(8, this, "ptr", varValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR()
        result := ComCall(9, this, "ptr", strName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return strName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsLocal() {
        result := ComCall(10, this, "short*", &bIsLocal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsLocal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PropagatesToSubclass() {
        result := ComCall(11, this, "short*", &bPropagatesToSubclass := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bPropagatesToSubclass
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @returns {HRESULT} 
     */
    put_PropagatesToSubclass(bPropagatesToSubclass) {
        result := ComCall(12, this, "short", bPropagatesToSubclass, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_PropagatesToInstance() {
        result := ComCall(13, this, "short*", &bPropagatesToInstance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bPropagatesToInstance
    }

    /**
     * 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @returns {HRESULT} 
     */
    put_PropagatesToInstance(bPropagatesToInstance) {
        result := ComCall(14, this, "short", bPropagatesToInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsOverridable() {
        result := ComCall(15, this, "short*", &bIsOverridable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsOverridable
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @returns {HRESULT} 
     */
    put_IsOverridable(bIsOverridable) {
        result := ComCall(16, this, "short", bIsOverridable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsAmended() {
        result := ComCall(17, this, "short*", &bIsAmended := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bIsAmended
    }
}
