#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ISpotLight extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpotLight
     * @type {Guid}
     */
    static IID => Guid("{5a9fe273-44a1-4f95-a422-8fa5116bdb44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConstantAttenuation", "put_ConstantAttenuation", "get_CoordinateSpace", "put_CoordinateSpace", "get_Direction", "put_Direction", "get_InnerConeAngle", "put_InnerConeAngle", "get_InnerConeAngleInDegrees", "put_InnerConeAngleInDegrees", "get_InnerConeColor", "put_InnerConeColor", "get_LinearAttenuation", "put_LinearAttenuation", "get_Offset", "put_Offset", "get_OuterConeAngle", "put_OuterConeAngle", "get_OuterConeAngleInDegrees", "put_OuterConeAngleInDegrees", "get_OuterConeColor", "put_OuterConeColor", "get_QuadraticAttenuation", "put_QuadraticAttenuation"]

    /**
     * @type {Float} 
     */
    ConstantAttenuation {
        get => this.get_ConstantAttenuation()
        set => this.put_ConstantAttenuation(value)
    }

    /**
     * @type {Visual} 
     */
    CoordinateSpace {
        get => this.get_CoordinateSpace()
        set => this.put_CoordinateSpace(value)
    }

    /**
     * @type {Vector3} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * @type {Float} 
     */
    InnerConeAngle {
        get => this.get_InnerConeAngle()
        set => this.put_InnerConeAngle(value)
    }

    /**
     * @type {Float} 
     */
    InnerConeAngleInDegrees {
        get => this.get_InnerConeAngleInDegrees()
        set => this.put_InnerConeAngleInDegrees(value)
    }

    /**
     * @type {Color} 
     */
    InnerConeColor {
        get => this.get_InnerConeColor()
        set => this.put_InnerConeColor(value)
    }

    /**
     * @type {Float} 
     */
    LinearAttenuation {
        get => this.get_LinearAttenuation()
        set => this.put_LinearAttenuation(value)
    }

    /**
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * @type {Float} 
     */
    OuterConeAngle {
        get => this.get_OuterConeAngle()
        set => this.put_OuterConeAngle(value)
    }

    /**
     * @type {Float} 
     */
    OuterConeAngleInDegrees {
        get => this.get_OuterConeAngleInDegrees()
        set => this.put_OuterConeAngleInDegrees(value)
    }

    /**
     * @type {Color} 
     */
    OuterConeColor {
        get => this.get_OuterConeColor()
        set => this.put_OuterConeColor(value)
    }

    /**
     * @type {Float} 
     */
    QuadraticAttenuation {
        get => this.get_QuadraticAttenuation()
        set => this.put_QuadraticAttenuation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ConstantAttenuation() {
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
    put_ConstantAttenuation(value) {
        result := ComCall(7, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CoordinateSpace() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CoordinateSpace(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Direction() {
        value := Vector3()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_Direction(value) {
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
    get_InnerConeAngle() {
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
    put_InnerConeAngle(value) {
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
    get_InnerConeAngleInDegrees() {
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
    put_InnerConeAngleInDegrees(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_InnerConeColor() {
        value := Color()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_InnerConeColor(value) {
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
    get_LinearAttenuation() {
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
    put_LinearAttenuation(value) {
        result := ComCall(19, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        value := Vector3()
        result := ComCall(20, this, "ptr", value, "int")
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
    put_Offset(value) {
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
    get_OuterConeAngle() {
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
    put_OuterConeAngle(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterConeAngleInDegrees() {
        result := ComCall(24, this, "float*", &value := 0, "int")
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
    put_OuterConeAngleInDegrees(value) {
        result := ComCall(25, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OuterConeColor() {
        value := Color()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_OuterConeColor(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_QuadraticAttenuation() {
        result := ComCall(28, this, "float*", &value := 0, "int")
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
    put_QuadraticAttenuation(value) {
        result := ComCall(29, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
