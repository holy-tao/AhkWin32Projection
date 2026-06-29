#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IBDA_SignalStatistics interface is implemented on a BDA device filter and provides methods by which the filter can describe the condition of a signal that is being received.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_SignalStatistics)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_signalstatistics
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_SignalStatistics extends IUnknown {
    /**
     * The interface identifier for IBDA_SignalStatistics
     * @type {Guid}
     */
    static IID := Guid("{1347d106-cf3a-428a-a5cb-ac0d9a2a4338}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_SignalStatistics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        put_SignalStrength : IntPtr
        get_SignalStrength : IntPtr
        put_SignalQuality  : IntPtr
        get_SignalQuality  : IntPtr
        put_SignalPresent  : IntPtr
        get_SignalPresent  : IntPtr
        put_SignalLocked   : IntPtr
        get_SignalLocked   : IntPtr
        put_SampleTime     : IntPtr
        get_SampleTime     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_SignalStatistics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    SignalStrength {
        get => this.get_SignalStrength()
        set => this.put_SignalStrength(value)
    }

    /**
     * @type {Integer} 
     */
    SignalQuality {
        get => this.get_SignalQuality()
        set => this.put_SignalQuality(value)
    }

    /**
     * @type {BOOLEAN} 
     */
    SignalPresent {
        get => this.get_SignalPresent()
        set => this.put_SignalPresent(value)
    }

    /**
     * @type {BOOLEAN} 
     */
    SignalLocked {
        get => this.get_SignalLocked()
        set => this.put_SignalLocked(value)
    }

    /**
     * @type {Integer} 
     */
    SampleTime {
        get => this.get_SampleTime()
        set => this.put_SampleTime(value)
    }

    /**
     * The put_SignalStrength method specifies the strength of the signal in decibels.
     * @param {Integer} lDbStrength Long integer that specifies the db strength.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalstrength
     */
    put_SignalStrength(lDbStrength) {
        result := ComCall(3, this, "int", lDbStrength, "HRESULT")
        return result
    }

    /**
     * The get_SignalStrength method retrieves a value that indicates the strength of the signal in decibels.
     * @param {Pointer<Integer>} plDbStrength Pointer that receives the signal strength value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalstrength
     */
    get_SignalStrength(plDbStrength) {
        plDbStrengthMarshal := plDbStrength is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plDbStrengthMarshal, plDbStrength, "HRESULT")
        return result
    }

    /**
     * The put_SignalQuality method specifies the quality of the signal.
     * @param {Integer} lPercentQuality Long integer that specifies the quality of the signal as a percentage. 100 indicates best quality and 0 indicates worst quality.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalquality
     */
    put_SignalQuality(lPercentQuality) {
        result := ComCall(5, this, "int", lPercentQuality, "HRESULT")
        return result
    }

    /**
     * The get_SignalQuality method retrieves a value from 1 to 100 indicating the quality of the signal.
     * @param {Pointer<Integer>} plPercentQuality Pointer that receives the value as a percentage. 100 indicates best quality and 0 indicates worst quality.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalquality
     */
    get_SignalQuality(plPercentQuality) {
        plPercentQualityMarshal := plPercentQuality is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, plPercentQualityMarshal, plPercentQuality, "HRESULT")
        return result
    }

    /**
     * The put_SignalPresent method specifies whether a signal is present.
     * @param {BOOLEAN} fPresent Flag indicating whether the signal is present. <b>TRUE</b> means a signal is present.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signalpresent
     */
    put_SignalPresent(fPresent) {
        result := ComCall(7, this, BOOLEAN, fPresent, "HRESULT")
        return result
    }

    /**
     * The get_SignalPresent method retrieves a Boolean value indicating whether a signal is present.
     * @param {Pointer<Integer>} pfPresent Pointer to a flag indicating whether a signal is present.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signalpresent
     */
    get_SignalPresent(pfPresent) {
        pfPresentMarshal := pfPresent is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pfPresentMarshal, pfPresent, "HRESULT")
        return result
    }

    /**
     * The put_SignalLocked method specifies whether the signal is locked.
     * @param {BOOLEAN} fLocked Flag that indicates whether to lock the signal.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_signallocked
     */
    put_SignalLocked(fLocked) {
        result := ComCall(9, this, BOOLEAN, fLocked, "HRESULT")
        return result
    }

    /**
     * The get_SignalLocked method retrieves a Boolean value indicating whether the signal is locked.
     * @param {Pointer<Integer>} pfLocked Pointer to a flag indicating whether the signal is locked.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_signallocked
     */
    get_SignalLocked(pfLocked) {
        pfLockedMarshal := pfLocked is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pfLockedMarshal, pfLocked, "HRESULT")
        return result
    }

    /**
     * The put_SampleTime method specifies the sample time of the signal.
     * @param {Integer} lmsSampleTime Specifies the sample time.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-put_sampletime
     */
    put_SampleTime(lmsSampleTime) {
        result := ComCall(11, this, "int", lmsSampleTime, "HRESULT")
        return result
    }

    /**
     * The get_SampleTime method retrieves the sample time used to measure the signal.
     * @param {Pointer<Integer>} plmsSampleTime Pointer that receives the sample time.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_signalstatistics-get_sampletime
     */
    get_SampleTime(plmsSampleTime) {
        plmsSampleTimeMarshal := plmsSampleTime is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plmsSampleTimeMarshal, plmsSampleTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_SignalStatistics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_SignalStrength := CallbackCreate(GetMethod(implObj, "put_SignalStrength"), flags, 2)
        this.vtbl.get_SignalStrength := CallbackCreate(GetMethod(implObj, "get_SignalStrength"), flags, 2)
        this.vtbl.put_SignalQuality := CallbackCreate(GetMethod(implObj, "put_SignalQuality"), flags, 2)
        this.vtbl.get_SignalQuality := CallbackCreate(GetMethod(implObj, "get_SignalQuality"), flags, 2)
        this.vtbl.put_SignalPresent := CallbackCreate(GetMethod(implObj, "put_SignalPresent"), flags, 2)
        this.vtbl.get_SignalPresent := CallbackCreate(GetMethod(implObj, "get_SignalPresent"), flags, 2)
        this.vtbl.put_SignalLocked := CallbackCreate(GetMethod(implObj, "put_SignalLocked"), flags, 2)
        this.vtbl.get_SignalLocked := CallbackCreate(GetMethod(implObj, "get_SignalLocked"), flags, 2)
        this.vtbl.put_SampleTime := CallbackCreate(GetMethod(implObj, "put_SampleTime"), flags, 2)
        this.vtbl.get_SampleTime := CallbackCreate(GetMethod(implObj, "get_SampleTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_SignalStrength)
        CallbackFree(this.vtbl.get_SignalStrength)
        CallbackFree(this.vtbl.put_SignalQuality)
        CallbackFree(this.vtbl.get_SignalQuality)
        CallbackFree(this.vtbl.put_SignalPresent)
        CallbackFree(this.vtbl.get_SignalPresent)
        CallbackFree(this.vtbl.put_SignalLocked)
        CallbackFree(this.vtbl.get_SignalLocked)
        CallbackFree(this.vtbl.put_SampleTime)
        CallbackFree(this.vtbl.get_SampleTime)
    }
}
