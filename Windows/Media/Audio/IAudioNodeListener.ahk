#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\Foundation\Numerics\Quaternion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioNodeListener extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioNodeListener
     * @type {Guid}
     */
    static IID => Guid("{d9722e16-0c0a-41da-b755-6c77835fb1eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "put_Position", "get_Orientation", "put_Orientation", "get_SpeedOfSound", "put_SpeedOfSound", "get_DopplerVelocity", "put_DopplerVelocity"]

    /**
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * @type {Float} 
     */
    SpeedOfSound {
        get => this.get_SpeedOfSound()
        set => this.put_SpeedOfSound(value)
    }

    /**
     * @type {Vector3} 
     */
    DopplerVelocity {
        get => this.get_DopplerVelocity()
        set => this.put_DopplerVelocity(value)
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
     * @returns {Quaternion} 
     */
    get_Orientation() {
        value := Quaternion()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
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
    get_SpeedOfSound() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_SpeedOfSound(value) {
        result := ComCall(11, this, "double", value, "int")
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
    put_DopplerVelocity(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
