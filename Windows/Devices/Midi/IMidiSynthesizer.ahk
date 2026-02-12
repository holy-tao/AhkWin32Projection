#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiSynthesizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiSynthesizer
     * @type {Guid}
     */
    static IID => Guid("{f0da155e-db90-405f-b8ae-21d2e17f2e45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioDevice", "get_Volume", "put_Volume"]

    /**
     * @type {DeviceInformation} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
    }

    /**
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_AudioDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        result := ComCall(7, this, "double*", &value := 0, "int")
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
    put_Volume(value) {
        result := ComCall(8, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
