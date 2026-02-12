#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneMaterialInput.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class IScenePbrMaterial extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScenePbrMaterial
     * @type {Guid}
     */
    static IID => Guid("{aab6ebbe-d680-46df-8294-b6800a9f95e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlphaCutoff", "put_AlphaCutoff", "get_AlphaMode", "put_AlphaMode", "get_EmissiveInput", "put_EmissiveInput", "get_EmissiveFactor", "put_EmissiveFactor", "get_IsDoubleSided", "put_IsDoubleSided", "get_NormalInput", "put_NormalInput", "get_NormalScale", "put_NormalScale", "get_OcclusionInput", "put_OcclusionInput", "get_OcclusionStrength", "put_OcclusionStrength"]

    /**
     * @type {Float} 
     */
    AlphaCutoff {
        get => this.get_AlphaCutoff()
        set => this.put_AlphaCutoff(value)
    }

    /**
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
        set => this.put_AlphaMode(value)
    }

    /**
     * @type {SceneMaterialInput} 
     */
    EmissiveInput {
        get => this.get_EmissiveInput()
        set => this.put_EmissiveInput(value)
    }

    /**
     * @type {Vector3} 
     */
    EmissiveFactor {
        get => this.get_EmissiveFactor()
        set => this.put_EmissiveFactor(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDoubleSided {
        get => this.get_IsDoubleSided()
        set => this.put_IsDoubleSided(value)
    }

    /**
     * @type {SceneMaterialInput} 
     */
    NormalInput {
        get => this.get_NormalInput()
        set => this.put_NormalInput(value)
    }

    /**
     * @type {Float} 
     */
    NormalScale {
        get => this.get_NormalScale()
        set => this.put_NormalScale(value)
    }

    /**
     * @type {SceneMaterialInput} 
     */
    OcclusionInput {
        get => this.get_OcclusionInput()
        set => this.put_OcclusionInput(value)
    }

    /**
     * @type {Float} 
     */
    OcclusionStrength {
        get => this.get_OcclusionStrength()
        set => this.put_OcclusionStrength(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AlphaCutoff() {
        result := ComCall(6, this, "float*", &value := 0, "int")
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
    put_AlphaCutoff(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlphaMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_EmissiveInput() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
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
    put_EmissiveInput(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_EmissiveFactor() {
        value := Vector3()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_EmissiveFactor(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleSided() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDoubleSided(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_NormalInput() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
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
    put_NormalInput(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NormalScale() {
        result := ComCall(18, this, "float*", &value := 0, "int")
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
    put_NormalScale(value) {
        result := ComCall(19, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_OcclusionInput() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
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
    put_OcclusionInput(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OcclusionStrength() {
        result := ComCall(22, this, "float*", &value := 0, "int")
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
    put_OcclusionStrength(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
