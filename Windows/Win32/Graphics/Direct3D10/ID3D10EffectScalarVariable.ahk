#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * An effect-scalar-variable interface accesses scalar values.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectscalarvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectScalarVariable extends ID3D10EffectVariable{
    /**
     * The interface identifier for ID3D10EffectScalarVariable
     * @type {Guid}
     */
    static IID => Guid("{00e48f7b-d2c8-49e8-a86c-022dee53431f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetFloat(Value) {
        result := ComCall(25, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetFloat(pValue) {
        result := ComCall(26, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetFloatArray(pData, Offset, Count) {
        result := ComCall(27, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetFloatArray(pData, Offset, Count) {
        result := ComCall(28, this, "float*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetInt(Value) {
        result := ComCall(29, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetInt(pValue) {
        result := ComCall(30, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetIntArray(pData, Offset, Count) {
        result := ComCall(31, this, "int*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetIntArray(pData, Offset, Count) {
        result := ComCall(32, this, "int*", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Value 
     * @returns {HRESULT} 
     */
    SetBool(Value) {
        result := ComCall(33, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pValue 
     * @returns {HRESULT} 
     */
    GetBool(pValue) {
        result := ComCall(34, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetBoolArray(pData, Offset, Count) {
        result := ComCall(35, this, "ptr", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pData 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    GetBoolArray(pData, Offset, Count) {
        result := ComCall(36, this, "ptr", pData, "uint", Offset, "uint", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
