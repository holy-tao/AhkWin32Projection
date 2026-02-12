#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AdcChannel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Acquires a connection to the specified channel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.adc.provider.iadccontrollerprovider.acquirechannel
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class IAdcController extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcController
     * @type {Guid}
     */
    static IID => Guid("{2a76e4b0-a896-4219-86b6-ea8cdce98f56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChannelCount", "get_ResolutionInBits", "get_MinValue", "get_MaxValue", "get_ChannelMode", "put_ChannelMode", "IsChannelModeSupported", "OpenChannel"]

    /**
     * @type {Integer} 
     */
    ChannelCount {
        get => this.get_ChannelCount()
    }

    /**
     * @type {Integer} 
     */
    ResolutionInBits {
        get => this.get_ResolutionInBits()
    }

    /**
     * @type {Integer} 
     */
    MinValue {
        get => this.get_MinValue()
    }

    /**
     * @type {Integer} 
     */
    MaxValue {
        get => this.get_MaxValue()
    }

    /**
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
     * 
     * @param {Integer} channelMode 
     * @returns {Boolean} 
     */
    IsChannelModeSupported(channelMode) {
        result := ComCall(12, this, "int", channelMode, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} channelNumber 
     * @returns {AdcChannel} 
     */
    OpenChannel(channelNumber) {
        result := ComCall(13, this, "int", channelNumber, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdcChannel(result_)
    }
}
