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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frequency", "put_Frequency", "get_CadenceOn", "put_CadenceOn", "get_CadenceOff", "put_CadenceOff", "get_Volume", "put_Volume"]

    /**
     * @type {Integer} 
     */
    Frequency {
        get => this.get_Frequency()
        set => this.put_Frequency(value)
    }

    /**
     * @type {Integer} 
     */
    CadenceOn {
        get => this.get_CadenceOn()
        set => this.put_CadenceOn(value)
    }

    /**
     * @type {Integer} 
     */
    CadenceOff {
        get => this.get_CadenceOff()
        set => this.put_CadenceOff(value)
    }

    /**
     * @type {Integer} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_frequency
     */
    get_Frequency() {
        result := ComCall(7, this, "int*", &plFrequency := 0, "HRESULT")
        return plFrequency
    }

    /**
     * 
     * @param {Integer} lFrequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_frequency
     */
    put_Frequency(lFrequency) {
        result := ComCall(8, this, "int", lFrequency, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_cadenceon
     */
    get_CadenceOn() {
        result := ComCall(9, this, "int*", &plCadenceOn := 0, "HRESULT")
        return plCadenceOn
    }

    /**
     * 
     * @param {Integer} CadenceOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_cadenceon
     */
    put_CadenceOn(CadenceOn) {
        result := ComCall(10, this, "int", CadenceOn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_cadenceoff
     */
    get_CadenceOff() {
        result := ComCall(11, this, "int*", &plCadenceOff := 0, "HRESULT")
        return plCadenceOff
    }

    /**
     * 
     * @param {Integer} lCadenceOff 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_cadenceoff
     */
    put_CadenceOff(lCadenceOff) {
        result := ComCall(12, this, "int", lCadenceOff, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_volume
     */
    get_Volume() {
        result := ComCall(13, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(14, this, "int", lVolume, "HRESULT")
        return result
    }
}
