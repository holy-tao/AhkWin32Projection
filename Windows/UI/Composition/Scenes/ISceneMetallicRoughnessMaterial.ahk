#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneMaterialInput.ahk
#Include ..\..\..\Foundation\Numerics\Vector4.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneMetallicRoughnessMaterial extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneMetallicRoughnessMaterial
     * @type {Guid}
     */
    static IID => Guid("{c1d91446-799c-429e-a4e4-5da645f18e61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseColorInput", "put_BaseColorInput", "get_BaseColorFactor", "put_BaseColorFactor", "get_MetallicFactor", "put_MetallicFactor", "get_MetallicRoughnessInput", "put_MetallicRoughnessInput", "get_RoughnessFactor", "put_RoughnessFactor"]

    /**
     * @type {SceneMaterialInput} 
     */
    BaseColorInput {
        get => this.get_BaseColorInput()
        set => this.put_BaseColorInput(value)
    }

    /**
     * @type {Vector4} 
     */
    BaseColorFactor {
        get => this.get_BaseColorFactor()
        set => this.put_BaseColorFactor(value)
    }

    /**
     * @type {Float} 
     */
    MetallicFactor {
        get => this.get_MetallicFactor()
        set => this.put_MetallicFactor(value)
    }

    /**
     * @type {SceneMaterialInput} 
     */
    MetallicRoughnessInput {
        get => this.get_MetallicRoughnessInput()
        set => this.put_MetallicRoughnessInput(value)
    }

    /**
     * @type {Float} 
     */
    RoughnessFactor {
        get => this.get_RoughnessFactor()
        set => this.put_RoughnessFactor(value)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_BaseColorInput() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneMaterialInput(value)
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_BaseColorInput(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector4} 
     */
    get_BaseColorFactor() {
        value := Vector4()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector4} value 
     * @returns {HRESULT} 
     */
    put_BaseColorFactor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MetallicFactor() {
        result := ComCall(10, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MetallicFactor(value) {
        result := ComCall(11, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_MetallicRoughnessInput() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneMaterialInput(value)
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_MetallicRoughnessInput(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoughnessFactor() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoughnessFactor(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
