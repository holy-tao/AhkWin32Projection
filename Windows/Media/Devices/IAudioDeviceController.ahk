#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IAudioDeviceController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioDeviceController
     * @type {Guid}
     */
    static IID => Guid("{edd4a388-79c7-4f7c-90e8-ef934b21580a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Muted", "get_Muted", "put_VolumePercent", "get_VolumePercent"]

    /**
     * @type {Boolean} 
     */
    Muted {
        get => this.get_Muted()
        set => this.put_Muted(value)
    }

    /**
     * @type {Float} 
     */
    VolumePercent {
        get => this.get_VolumePercent()
        set => this.put_VolumePercent(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Muted(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Muted() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_VolumePercent(value) {
        result := ComCall(8, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VolumePercent() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
