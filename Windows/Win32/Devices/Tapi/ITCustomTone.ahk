#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITCustomTone interface exposes methods that allow detailed control over the custom tones that are available with some phone sets.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itcustomtone
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITCustomTone extends IDispatch {
    /**
     * The interface identifier for ITCustomTone
     * @type {Guid}
     */
    static IID := Guid("{357ad764-b3c6-4b2a-8fa5-0722827a9254}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITCustomTone interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Frequency  : IntPtr
        put_Frequency  : IntPtr
        get_CadenceOn  : IntPtr
        put_CadenceOn  : IntPtr
        get_CadenceOff : IntPtr
        put_CadenceOff : IntPtr
        get_Volume     : IntPtr
        put_Volume     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITCustomTone.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * The get_Frequency method retrieves the frequency of the tone component to generate.
     * @returns {Integer} Pointer to a value to receive the frequency, in hertz, of the tone component.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_frequency
     */
    get_Frequency() {
        result := ComCall(7, this, "int*", &plFrequency := 0, "HRESULT")
        return plFrequency
    }

    /**
     * The put_Frequency method sets the frequency of the tone component to generate.
     * @param {Integer} lFrequency Specifies the frequency, in hertz, of the tone component.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_frequency
     */
    put_Frequency(lFrequency) {
        result := ComCall(8, this, "int", lFrequency, "HRESULT")
        return result
    }

    /**
     * The get_CadenceOn method retrieves the &quot;on&quot; duration of the cadence of the custom tone to generate.
     * @returns {Integer} Pointer to a value to receive the "on" duration, in milliseconds, of the cadence of the custom tone. Zero means no tone is generated.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_cadenceon
     */
    get_CadenceOn() {
        result := ComCall(9, this, "int*", &plCadenceOn := 0, "HRESULT")
        return plCadenceOn
    }

    /**
     * The put_CadenceOn method sets the &quot;on&quot; duration of the cadence of the custom tone to generate.
     * @param {Integer} CadenceOn Specifies the "on" duration, in milliseconds, of the cadence of the custom tone to generate. Zero means no tone is generated.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_cadenceon
     */
    put_CadenceOn(CadenceOn) {
        result := ComCall(10, this, "int", CadenceOn, "HRESULT")
        return result
    }

    /**
     * The get_CadenceOff method retrieves the &quot;off&quot; duration of the cadence of the custom tone to generate.
     * @returns {Integer} Pointer to a value to receive the "off" duration, in milliseconds, of the cadence of the custom tone. Zero means no off time, that is, a constant tone.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_cadenceoff
     */
    get_CadenceOff() {
        result := ComCall(11, this, "int*", &plCadenceOff := 0, "HRESULT")
        return plCadenceOff
    }

    /**
     * The put_CadenceOff method sets the &quot;off&quot; duration of the cadence of the custom tone to generate.
     * @param {Integer} lCadenceOff Specifies the "off" duration, in milliseconds, of the cadence of the custom tone to generate. Zero means no off time, that is, a constant tone.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_cadenceoff
     */
    put_CadenceOff(lCadenceOff) {
        result := ComCall(12, this, "int", lCadenceOff, "HRESULT")
        return result
    }

    /**
     * The get_Volume method retrieves the volume level at which to generate the tone.
     * @returns {Integer} Pointer to a value to receive the volume level. A value of 0x0000FFFF represents full volume; a value of 0x00000000 represents silence.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-get_volume
     */
    get_Volume() {
        result := ComCall(13, this, "int*", &plVolume := 0, "HRESULT")
        return plVolume
    }

    /**
     * The put_Volume method sets the volume level at which to generate the tone.
     * @param {Integer} lVolume Specifies the volume level for the tone. A value of 0x0000FFFF represents full volume; a value of 0x00000000 represents silence.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcustomtone-put_volume
     */
    put_Volume(lVolume) {
        result := ComCall(14, this, "int", lVolume, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITCustomTone.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Frequency := CallbackCreate(GetMethod(implObj, "get_Frequency"), flags, 2)
        this.vtbl.put_Frequency := CallbackCreate(GetMethod(implObj, "put_Frequency"), flags, 2)
        this.vtbl.get_CadenceOn := CallbackCreate(GetMethod(implObj, "get_CadenceOn"), flags, 2)
        this.vtbl.put_CadenceOn := CallbackCreate(GetMethod(implObj, "put_CadenceOn"), flags, 2)
        this.vtbl.get_CadenceOff := CallbackCreate(GetMethod(implObj, "get_CadenceOff"), flags, 2)
        this.vtbl.put_CadenceOff := CallbackCreate(GetMethod(implObj, "put_CadenceOff"), flags, 2)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 2)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Frequency)
        CallbackFree(this.vtbl.put_Frequency)
        CallbackFree(this.vtbl.get_CadenceOn)
        CallbackFree(this.vtbl.put_CadenceOn)
        CallbackFree(this.vtbl.get_CadenceOff)
        CallbackFree(this.vtbl.put_CadenceOff)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_Volume)
    }
}
