#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCustomTone interface exposes methods that allow detailed control over the custom tones that are available with some phone sets.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcustomtone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCustomTone extends IDispatch{
    /**
     * The interface identifier for ITCustomTone
     * @type {Guid}
     */
    static IID => Guid("{357ad764-b3c6-4b2a-8fa5-0722827a9254}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plFrequency 
     * @returns {HRESULT} 
     */
    get_Frequency(plFrequency) {
        result := ComCall(7, this, "int*", plFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFrequency 
     * @returns {HRESULT} 
     */
    put_Frequency(lFrequency) {
        result := ComCall(8, this, "int", lFrequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCadenceOn 
     * @returns {HRESULT} 
     */
    get_CadenceOn(plCadenceOn) {
        result := ComCall(9, this, "int*", plCadenceOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CadenceOn 
     * @returns {HRESULT} 
     */
    put_CadenceOn(CadenceOn) {
        result := ComCall(10, this, "int", CadenceOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCadenceOff 
     * @returns {HRESULT} 
     */
    get_CadenceOff(plCadenceOff) {
        result := ComCall(11, this, "int*", plCadenceOff, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCadenceOff 
     * @returns {HRESULT} 
     */
    put_CadenceOff(lCadenceOff) {
        result := ComCall(12, this, "int", lCadenceOff, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plVolume 
     * @returns {HRESULT} 
     */
    get_Volume(plVolume) {
        result := ComCall(13, this, "int*", plVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_Volume(lVolume) {
        result := ComCall(14, this, "int", lVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
