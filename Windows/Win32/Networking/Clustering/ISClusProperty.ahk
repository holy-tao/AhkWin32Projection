#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusProperty extends IDispatch{
    /**
     * The interface identifier for ISClusProperty
     * @type {Guid}
     */
    static IID => Guid("{f2e606fe-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLength 
     * @returns {HRESULT} 
     */
    get_Length(pLength) {
        result := ComCall(8, this, "int*", pLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_ValueCount(pCount) {
        result := ComCall(9, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusPropertyValues>} ppClusterPropertyValues 
     * @returns {HRESULT} 
     */
    get_Values(ppClusterPropertyValues) {
        result := ComCall(10, this, "ptr", ppClusterPropertyValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    get_Value(pvarValue) {
        result := ComCall(11, this, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varValue 
     * @returns {HRESULT} 
     */
    put_Value(varValue) {
        result := ComCall(12, this, "ptr", varValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_Type(pType) {
        result := ComCall(13, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    put_Type(Type) {
        result := ComCall(14, this, "int", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pFormat 
     * @returns {HRESULT} 
     */
    get_Format(pFormat) {
        result := ComCall(15, this, "int*", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Format 
     * @returns {HRESULT} 
     */
    put_Format(Format) {
        result := ComCall(16, this, "int", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarReadOnly 
     * @returns {HRESULT} 
     */
    get_ReadOnly(pvarReadOnly) {
        result := ComCall(17, this, "ptr", pvarReadOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarPrivate 
     * @returns {HRESULT} 
     */
    get_Private(pvarPrivate) {
        result := ComCall(18, this, "ptr", pvarPrivate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarCommon 
     * @returns {HRESULT} 
     */
    get_Common(pvarCommon) {
        result := ComCall(19, this, "ptr", pvarCommon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarModified 
     * @returns {HRESULT} 
     */
    get_Modified(pvarModified) {
        result := ComCall(20, this, "ptr", pvarModified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UseDefaultValue() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
