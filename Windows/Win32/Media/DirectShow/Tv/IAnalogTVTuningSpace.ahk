#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk

/**
 * The IAnalogTVTuningSpace interface provides methods for getting and setting parameters associated with analog TV tuning spaces. The Video Control uses these methods when building and controlling a WDM Analog TV filter graph.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAnalogTVTuningSpace)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ianalogtvtuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAnalogTVTuningSpace extends ITuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnalogTVTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{2a6e293c-2595-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for AnalogTVTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{8a674b4d-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinChannel", "put_MinChannel", "get_MaxChannel", "put_MaxChannel", "get_InputType", "put_InputType", "get_CountryCode", "put_CountryCode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_minchannel
     */
    get_MinChannel() {
        result := ComCall(26, this, "int*", &MinChannelVal := 0, "HRESULT")
        return MinChannelVal
    }

    /**
     * 
     * @param {Integer} NewMinChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_minchannel
     */
    put_MinChannel(NewMinChannelVal) {
        result := ComCall(27, this, "int", NewMinChannelVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_maxchannel
     */
    get_MaxChannel() {
        result := ComCall(28, this, "int*", &MaxChannelVal := 0, "HRESULT")
        return MaxChannelVal
    }

    /**
     * 
     * @param {Integer} NewMaxChannelVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_maxchannel
     */
    put_MaxChannel(NewMaxChannelVal) {
        result := ComCall(29, this, "int", NewMaxChannelVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_inputtype
     */
    get_InputType() {
        result := ComCall(30, this, "int*", &InputTypeVal := 0, "HRESULT")
        return InputTypeVal
    }

    /**
     * 
     * @param {Integer} NewInputTypeVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_inputtype
     */
    put_InputType(NewInputTypeVal) {
        result := ComCall(31, this, "int", NewInputTypeVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-get_countrycode
     */
    get_CountryCode() {
        result := ComCall(32, this, "int*", &CountryCodeVal := 0, "HRESULT")
        return CountryCodeVal
    }

    /**
     * 
     * @param {Integer} NewCountryCodeVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ianalogtvtuningspace-put_countrycode
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(33, this, "int", NewCountryCodeVal, "HRESULT")
        return result
    }
}
