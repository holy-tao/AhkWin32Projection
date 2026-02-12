#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include .\AudioNodeEmitterShape.ahk
#Include .\AudioNodeEmitterDecayModel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeEmitter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeEmitter
     * @type {Guid}
     */
    static IID => Guid("{3676971d-880a-47b8-adf7-1323a9d965be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "put_Position", "get_Direction", "put_Direction", "get_Shape", "get_DecayModel", "get_Gain", "put_Gain", "get_DistanceScale", "put_DistanceScale", "get_DopplerScale", "put_DopplerScale", "get_DopplerVelocity", "put_DopplerVelocity", "get_IsDopplerDisabled"]

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {Vector3} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * @type {AudioNodeEmitterShape} 
     */
    Shape {
        get => this.get_Shape()
    }

    /**
     * @type {AudioNodeEmitterDecayModel} 
     */
    DecayModel {
        get => this.get_DecayModel()
    }

    /**
     * @type {Float} 
     */
    Gain {
        get => this.get_Gain()
        set => this.put_Gain(value)
    }

    /**
     * @type {Float} 
     */
    DistanceScale {
        get => this.get_DistanceScale()
        set => this.put_DistanceScale(value)
    }

    /**
     * @type {Float} 
     */
    DopplerScale {
        get => this.get_DopplerScale()
        set => this.put_DopplerScale(value)
    }

    /**
     * @type {Vector3} 
     */
    DopplerVelocity {
        get => this.get_DopplerVelocity()
        set => this.put_DopplerVelocity(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDopplerDisabled {
        get => this.get_IsDopplerDisabled()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
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
    put_Position(value) {
        result := ComCall(7, this, "ptr", value, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AudioNodeEmitterShape} 
     */
    get_Shape() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterShape(value)
    }

    /**
     * 
     * @returns {AudioNodeEmitterDecayModel} 
     */
    get_DecayModel() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioNodeEmitterDecayModel(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Gain() {
        result := ComCall(12, this, "double*", &value := 0, "int")
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
    put_Gain(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DistanceScale() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_DistanceScale(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DopplerScale() {
        result := ComCall(16, this, "double*", &value := 0, "int")
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
    put_DopplerScale(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_DopplerVelocity() {
        value := Vector3()
        result := ComCall(18, this, "ptr", value, "int")
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
    put_DopplerVelocity(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDopplerDisabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
