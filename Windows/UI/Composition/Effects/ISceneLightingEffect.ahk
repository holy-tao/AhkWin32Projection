#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\Effects\IGraphicsEffectSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Effects
 * @version WindowsRuntime 1.4
 */
class ISceneLightingEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneLightingEffect
     * @type {Guid}
     */
    static IID => Guid("{91bb5e52-95d1-4f8b-9a5a-6408b24b8c6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AmbientAmount", "put_AmbientAmount", "get_DiffuseAmount", "put_DiffuseAmount", "get_NormalMapSource", "put_NormalMapSource", "get_SpecularAmount", "put_SpecularAmount", "get_SpecularShine", "put_SpecularShine"]

    /**
     * @type {Float} 
     */
    AmbientAmount {
        get => this.get_AmbientAmount()
        set => this.put_AmbientAmount(value)
    }

    /**
     * @type {Float} 
     */
    DiffuseAmount {
        get => this.get_DiffuseAmount()
        set => this.put_DiffuseAmount(value)
    }

    /**
     * @type {IGraphicsEffectSource} 
     */
    NormalMapSource {
        get => this.get_NormalMapSource()
        set => this.put_NormalMapSource(value)
    }

    /**
     * @type {Float} 
     */
    SpecularAmount {
        get => this.get_SpecularAmount()
        set => this.put_SpecularAmount(value)
    }

    /**
     * @type {Float} 
     */
    SpecularShine {
        get => this.get_SpecularShine()
        set => this.put_SpecularShine(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AmbientAmount() {
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
    put_AmbientAmount(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DiffuseAmount() {
        result := ComCall(8, this, "float*", &value := 0, "int")
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
    put_DiffuseAmount(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IGraphicsEffectSource} 
     */
    get_NormalMapSource() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGraphicsEffectSource(value)
    }

    /**
     * 
     * @param {IGraphicsEffectSource} value 
     * @returns {HRESULT} 
     */
    put_NormalMapSource(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpecularAmount() {
        result := ComCall(12, this, "float*", &value := 0, "int")
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
    put_SpecularAmount(value) {
        result := ComCall(13, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpecularShine() {
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
    put_SpecularShine(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
