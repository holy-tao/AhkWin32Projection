#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents properties and methods common to all ADC controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider
 * @namespace Windows.Devices.Adc.Provider
 * @version WindowsRuntime 1.4
 */
class IAdcControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{be545828-816d-4de5-a048-aba06958aaa8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChannelCount", "get_ResolutionInBits", "get_MinValue", "get_MaxValue", "get_ChannelMode", "put_ChannelMode", "IsChannelModeSupported", "AcquireChannel", "ReleaseChannel", "ReadValue"]

    /**
     * Gets the number of channels available on for the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.channelcount
     * @type {Integer} 
     */
    ChannelCount {
        get => this.get_ChannelCount()
    }

    /**
     * Gets the resolution of the controller as number of bits it has.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.resolutioninbits
     * @type {Integer} 
     */
    ResolutionInBits {
        get => this.get_ResolutionInBits()
    }

    /**
     * Gets the minimum value that the controller can return.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.minvalue
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
    }

    /**
     * Gets the maximum value that the controller can return.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.maxvalue
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
    }

    /**
     * Gets or sets the controller channel mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.channelmode
     * @type {Integer} 
     */
    ChannelMode {
        get => this.get_ChannelMode()
        set => this.put_ChannelMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelCount() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionInBits() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinValue() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxValue() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChannelMode() {
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
    put_ChannelMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if the specified channel mode is supported by the controller.
     * @param {Integer} channelMode The channel mode in question.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.ischannelmodesupported
     */
    IsChannelModeSupported(channelMode) {
        result := ComCall(12, this, "int", channelMode, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Acquires a connection to the specified channel.
     * @param {Integer} channel Which channel to connect to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.acquirechannel
     */
    AcquireChannel(channel) {
        result := ComCall(13, this, "int", channel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases the channel connection, opening that channel for others to use.
     * @param {Integer} channel Which channel to close the connection to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.releasechannel
     */
    ReleaseChannel(channel) {
        result := ComCall(14, this, "int", channel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the digital representation of the analog value on the specified channel.
     * @param {Integer} channelNumber Which channel to read from.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.readvalue
     */
    ReadValue(channelNumber) {
        result := ComCall(15, this, "int", channelNumber, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
