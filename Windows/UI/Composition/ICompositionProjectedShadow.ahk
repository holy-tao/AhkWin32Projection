#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionProjectedShadowCasterCollection.ahk
#Include .\CompositionLight.ahk
#Include .\CompositionProjectedShadowReceiverUnorderedCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionProjectedShadow extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionProjectedShadow
     * @type {Guid}
     */
    static IID => Guid("{285b8e72-4328-523f-bcf2-5557c52c3b25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlurRadiusMultiplier", "put_BlurRadiusMultiplier", "get_Casters", "get_LightSource", "put_LightSource", "get_MaxBlurRadius", "put_MaxBlurRadius", "get_MinBlurRadius", "put_MinBlurRadius", "get_Receivers"]

    /**
     * @type {Float} 
     */
    BlurRadiusMultiplier {
        get => this.get_BlurRadiusMultiplier()
        set => this.put_BlurRadiusMultiplier(value)
    }

    /**
     * @type {CompositionProjectedShadowCasterCollection} 
     */
    Casters {
        get => this.get_Casters()
    }

    /**
     * @type {CompositionLight} 
     */
    LightSource {
        get => this.get_LightSource()
        set => this.put_LightSource(value)
    }

    /**
     * @type {Float} 
     */
    MaxBlurRadius {
        get => this.get_MaxBlurRadius()
        set => this.put_MaxBlurRadius(value)
    }

    /**
     * @type {Float} 
     */
    MinBlurRadius {
        get => this.get_MinBlurRadius()
        set => this.put_MinBlurRadius(value)
    }

    /**
     * @type {CompositionProjectedShadowReceiverUnorderedCollection} 
     */
    Receivers {
        get => this.get_Receivers()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BlurRadiusMultiplier() {
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
    put_BlurRadiusMultiplier(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionProjectedShadowCasterCollection} 
     */
    get_Casters() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionProjectedShadowCasterCollection(value)
    }

    /**
     * 
     * @returns {CompositionLight} 
     */
    get_LightSource() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionLight(value)
    }

    /**
     * 
     * @param {CompositionLight} value 
     * @returns {HRESULT} 
     */
    put_LightSource(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxBlurRadius() {
        result := ComCall(11, this, "float*", &value := 0, "int")
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
    put_MaxBlurRadius(value) {
        result := ComCall(12, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinBlurRadius() {
        result := ComCall(13, this, "float*", &value := 0, "int")
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
    put_MinBlurRadius(value) {
        result := ComCall(14, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CompositionProjectedShadowReceiverUnorderedCollection} 
     */
    get_Receivers() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionProjectedShadowReceiverUnorderedCollection(value)
    }
}
