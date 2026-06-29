#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ILocator.ahk" { ILocator }
#Import ".\IScanningTuner.ahk" { IScanningTuner }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * This topic applies to Windows Vista.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IScanningTunerEx)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iscanningtunerex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IScanningTunerEx extends IScanningTuner {
    /**
     * The interface identifier for IScanningTunerEx
     * @type {Guid}
     */
    static IID := Guid("{04bbd195-0e2d-4593-9bd5-4f908bc33cf5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScanningTunerEx interfaces
    */
    struct Vtbl extends IScanningTuner.Vtbl {
        GetCurrentLocator                 : IntPtr
        PerformExhaustiveScan             : IntPtr
        TerminateCurrentScan              : IntPtr
        ResumeCurrentScan                 : IntPtr
        GetTunerScanningCapability        : IntPtr
        GetTunerStatus                    : IntPtr
        GetCurrentTunerStandardCapability : IntPtr
        SetScanSignalTypeFilter           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScanningTunerEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Pointer<ILocator>} pILocator Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface of the locator object. The caller must release the interface.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-getcurrentlocator
     */
    GetCurrentLocator(pILocator) {
        result := ComCall(18, this, ILocator.Ptr, pILocator, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @remarks
     * This method is asynchronous.
     * @param {Integer} dwLowerFreq Lowest frequency in the range of frequencies to scan. A value of -1 specifies the minimum frequency as determined by the device.
     * @param {Integer} dwHigherFreq Highest frequency in the range of frequencies to scan. A value of -1 specifies the maximum frequency as determined by the device.
     * @param {VARIANT_BOOL} bFineTune Specifies whether the tuner performs fine tuning. When the tuner locks onto a frequency, if this parameter is <b>VARIANT_TRUE</b>, the tuner does fine tuning to find the best possible signal around that frequency.
     * @param {Pointer} hEvent Handle to an event created by the application. When the tuner locks onto a signal, it signals this event.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No scan is currently in progress.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid frequency argument (for example, 0 <i>dwLowerFrequency</i> or <i>dwHigherFreq</i> value or <i>dwLowerFrequency</i> &gt;= <i>dwHigherFreq</i>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-performexhaustivescan
     */
    PerformExhaustiveScan(dwLowerFreq, dwHigherFreq, bFineTune, hEvent) {
        result := ComCall(19, this, "int", dwLowerFreq, "int", dwHigherFreq, VARIANT_BOOL, bFineTune, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @returns {Integer} Receives the last frequency that the tuner scanned before halting.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-terminatecurrentscan
     */
    TerminateCurrentScan() {
        result := ComCall(20, this, "int*", &pcurrentFreq := 0, "HRESULT")
        return pcurrentFreq
    }

    /**
     * This topic applies to Windows Vista and later.
     * @remarks
     * When the application calls <b>PerformExhaustiveScan</b>, the tuner scans until it locks onto a signal. Then it sets the application's event handle. To resume scanning for the next valid signal in original range of frequencies, the application can call <b>ResumeCurrentScan</b>.
     * @param {Pointer} hEvent Handle to an event created by the application. When the tuner locks onto a signal, it signals this event.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No scan has been started yet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>hEvent</i> argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-resumecurrentscan
     */
    ResumeCurrentScan(hEvent) {
        result := ComCall(21, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @remarks
     * The following broadcast standard GUIDs are defined in Bdamedia.h.
     * 
     * <table>
     * <tr>
     * <th><b>GUID</b></th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>ANALOG_AUXIN_NETWORK_TYPE</td>
     * <td>Auxiliary video input</td>
     * </tr>
     * <tr>
     * <td>ANALOG_FM_NETWORK_TYPE</td>
     * <td>FM radio tuner</td>
     * </tr>
     * <tr>
     * <td>ANALOG_TV_NETWORK_TYPE</td>
     * <td>Analog television</td>
     * </tr>
     * <tr>
     * <td>DIGITAL_CABLE_NETWORK_TYPE</td>
     * <td>Digital cable</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} HardwareAssistedScanning Receives a Boolean value. If the value is <b>TRUE</b>, the scanning algorithm is implemented entirely by the tuner hardware. Otherwise, the tuner filter implements part of the scanning algorithm in software.
     * @param {Pointer<Integer>} NumStandardsSupported Receives the number of broadcast standards supported by the tuner.
     * @param {Pointer<Guid>} BroadcastStandards Pointer to an array of GUIDs. The array must be large enough to hold a number of elements equal to the value returned in the <i>NumStandardsSupported</i> parameter. To find the required array size, call the method once and set this parameter to <b>NULL</b>. Then allocate the array and call the method again, setting this parameter to the address of the array.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-gettunerscanningcapability
     */
    GetTunerScanningCapability(HardwareAssistedScanning, NumStandardsSupported, BroadcastStandards) {
        HardwareAssistedScanningMarshal := HardwareAssistedScanning is VarRef ? "int*" : "ptr"
        NumStandardsSupportedMarshal := NumStandardsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, HardwareAssistedScanningMarshal, HardwareAssistedScanning, NumStandardsSupportedMarshal, NumStandardsSupported, Guid.Ptr, BroadcastStandards, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @remarks
     * While the scan is in progress, the application can use this method to estimate the total time required for the scan to complete. When the tuner locks onto a frequency and sets the application's event handle, the application can use this method to find the locked frequency.
     * @param {Pointer<Integer>} SecondsLeft Receives the estimated number of seconds remaining for the scan to complete.
     * @param {Pointer<Integer>} CurrentLockType Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/tunerlocktype">TunerLockType</a> enumeration, indicating how well the tuner locked onto a signal.
     * @param {Pointer<Integer>} AutoDetect Receives a Boolean value. If the value is <b>TRUE</b>, the tuner is in auto-detect mode.
     * @param {Pointer<Integer>} CurrentFreq Receives the frequency that was most recently scanned.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-gettunerstatus
     */
    GetTunerStatus(SecondsLeft, CurrentLockType, AutoDetect, CurrentFreq) {
        SecondsLeftMarshal := SecondsLeft is VarRef ? "int*" : "ptr"
        CurrentLockTypeMarshal := CurrentLockType is VarRef ? "int*" : "ptr"
        AutoDetectMarshal := AutoDetect is VarRef ? "int*" : "ptr"
        CurrentFreqMarshal := CurrentFreq is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, SecondsLeftMarshal, SecondsLeft, CurrentLockTypeMarshal, CurrentLockType, AutoDetectMarshal, AutoDetect, CurrentFreqMarshal, CurrentFreq, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Guid} CurrentBroadcastStandard GUID that specifies the broadcast standard to query. To find the broadcast standards supported by the tuner, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nf-tuner-iscanningtunerex-gettunerscanningcapability">GetTunerScanningCapability</a>.
     * @param {Pointer<Integer>} SettlingTime Receives the approximate amount of time the tuner requires to tune to a frequency, in milliseconds.
     * @param {Pointer<Integer>} TvStandardsSupported If <i>CurrentBroadcastStandard</i> is ANALOG_TV_NETWORK_TYPE, this parameter receives a bitwise OR of flags from the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration, indicating which analog television formats are supported by the tuner. Otherwise, this parameter is ignored.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-getcurrenttunerstandardcapability
     */
    GetCurrentTunerStandardCapability(CurrentBroadcastStandard, SettlingTime, TvStandardsSupported) {
        SettlingTimeMarshal := SettlingTime is VarRef ? "int*" : "ptr"
        TvStandardsSupportedMarshal := TvStandardsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, Guid, CurrentBroadcastStandard, SettlingTimeMarshal, SettlingTime, TvStandardsSupportedMarshal, TvStandardsSupported, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Integer} _ScanModulationTypes Specifies the modulation types, as a bitwise OR of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/scanmodulationtypes">ScanModulationTypes</a> enumeration. If the value is 0xFFFFFFFF, the tuner does not filter out any specific modulation types.
     * @param {Integer} _AnalogVideoStandard Specifies the analog standards, as a bitwise OR of flags from the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration. If the value is 0xFFFFFFFF, the tuner does not filter out any specific analog video standards.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-setscansignaltypefilter
     */
    SetScanSignalTypeFilter(_ScanModulationTypes, _AnalogVideoStandard) {
        result := ComCall(25, this, "int", _ScanModulationTypes, "int", _AnalogVideoStandard, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScanningTunerEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentLocator := CallbackCreate(GetMethod(implObj, "GetCurrentLocator"), flags, 2)
        this.vtbl.PerformExhaustiveScan := CallbackCreate(GetMethod(implObj, "PerformExhaustiveScan"), flags, 5)
        this.vtbl.TerminateCurrentScan := CallbackCreate(GetMethod(implObj, "TerminateCurrentScan"), flags, 2)
        this.vtbl.ResumeCurrentScan := CallbackCreate(GetMethod(implObj, "ResumeCurrentScan"), flags, 2)
        this.vtbl.GetTunerScanningCapability := CallbackCreate(GetMethod(implObj, "GetTunerScanningCapability"), flags, 4)
        this.vtbl.GetTunerStatus := CallbackCreate(GetMethod(implObj, "GetTunerStatus"), flags, 5)
        this.vtbl.GetCurrentTunerStandardCapability := CallbackCreate(GetMethod(implObj, "GetCurrentTunerStandardCapability"), flags, 4)
        this.vtbl.SetScanSignalTypeFilter := CallbackCreate(GetMethod(implObj, "SetScanSignalTypeFilter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentLocator)
        CallbackFree(this.vtbl.PerformExhaustiveScan)
        CallbackFree(this.vtbl.TerminateCurrentScan)
        CallbackFree(this.vtbl.ResumeCurrentScan)
        CallbackFree(this.vtbl.GetTunerScanningCapability)
        CallbackFree(this.vtbl.GetTunerStatus)
        CallbackFree(this.vtbl.GetCurrentTunerStandardCapability)
        CallbackFree(this.vtbl.SetScanSignalTypeFilter)
    }
}
