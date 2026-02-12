#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\MediaProperties\AudioEncodingProperties.ahk
#Include ..\..\Devices\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioGraphSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioGraphSettings
     * @type {Guid}
     */
    static IID => Guid("{1d59647f-e6fe-4628-84f8-9d8bdba25785}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncodingProperties", "put_EncodingProperties", "get_PrimaryRenderDevice", "put_PrimaryRenderDevice", "get_QuantumSizeSelectionMode", "put_QuantumSizeSelectionMode", "get_DesiredSamplesPerQuantum", "put_DesiredSamplesPerQuantum", "get_AudioRenderCategory", "put_AudioRenderCategory", "get_DesiredRenderDeviceAudioProcessing", "put_DesiredRenderDeviceAudioProcessing"]

    /**
     * @type {AudioEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
        set => this.put_EncodingProperties(value)
    }

    /**
     * @type {DeviceInformation} 
     */
    PrimaryRenderDevice {
        get => this.get_PrimaryRenderDevice()
        set => this.put_PrimaryRenderDevice(value)
    }

    /**
     * @type {Integer} 
     */
    QuantumSizeSelectionMode {
        get => this.get_QuantumSizeSelectionMode()
        set => this.put_QuantumSizeSelectionMode(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredSamplesPerQuantum {
        get => this.get_DesiredSamplesPerQuantum()
        set => this.put_DesiredSamplesPerQuantum(value)
    }

    /**
     * @type {Integer} 
     */
    AudioRenderCategory {
        get => this.get_AudioRenderCategory()
        set => this.put_AudioRenderCategory(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredRenderDeviceAudioProcessing {
        get => this.get_DesiredRenderDeviceAudioProcessing()
        set => this.put_DesiredRenderDeviceAudioProcessing(value)
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_EncodingProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioEncodingProperties(value)
    }

    /**
     * 
     * @param {AudioEncodingProperties} value 
     * @returns {HRESULT} 
     */
    put_EncodingProperties(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_PrimaryRenderDevice() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @param {DeviceInformation} value 
     * @returns {HRESULT} 
     */
    put_PrimaryRenderDevice(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QuantumSizeSelectionMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_QuantumSizeSelectionMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredSamplesPerQuantum() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_DesiredSamplesPerQuantum(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioRenderCategory() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AudioRenderCategory(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRenderDeviceAudioProcessing() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_DesiredRenderDeviceAudioProcessing(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
