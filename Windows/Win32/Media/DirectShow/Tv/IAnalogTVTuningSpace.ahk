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
     * 
     * @param {Pointer<Int32>} MinChannelVal 
     * @returns {HRESULT} 
     */
    get_MinChannel(MinChannelVal) {
        result := ComCall(26, this, "int*", MinChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMinChannelVal 
     * @returns {HRESULT} 
     */
    put_MinChannel(NewMinChannelVal) {
        result := ComCall(27, this, "int", NewMinChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} MaxChannelVal 
     * @returns {HRESULT} 
     */
    get_MaxChannel(MaxChannelVal) {
        result := ComCall(28, this, "int*", MaxChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewMaxChannelVal 
     * @returns {HRESULT} 
     */
    put_MaxChannel(NewMaxChannelVal) {
        result := ComCall(29, this, "int", NewMaxChannelVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} InputTypeVal 
     * @returns {HRESULT} 
     */
    get_InputType(InputTypeVal) {
        result := ComCall(30, this, "int*", InputTypeVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewInputTypeVal 
     * @returns {HRESULT} 
     */
    put_InputType(NewInputTypeVal) {
        result := ComCall(31, this, "int", NewInputTypeVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CountryCodeVal 
     * @returns {HRESULT} 
     */
    get_CountryCode(CountryCodeVal) {
        result := ComCall(32, this, "int*", CountryCodeVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewCountryCodeVal 
     * @returns {HRESULT} 
     */
    put_CountryCode(NewCountryCodeVal) {
        result := ComCall(33, this, "int", NewCountryCodeVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
