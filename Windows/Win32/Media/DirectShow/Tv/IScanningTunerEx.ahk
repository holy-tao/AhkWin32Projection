#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IScanningTuner.ahk

/**
 * This topic applies to Windows Vista.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IScanningTunerEx)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iscanningtunerex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IScanningTunerEx extends IScanningTuner{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScanningTunerEx
     * @type {Guid}
     */
    static IID => Guid("{04bbd195-0e2d-4593-9bd5-4f908bc33cf5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentLocator", "PerformExhaustiveScan", "TerminateCurrentScan", "ResumeCurrentScan", "GetTunerScanningCapability", "GetTunerStatus", "GetCurrentTunerStandardCapability", "SetScanSignalTypeFilter"]

    /**
     * This topic applies to Windows Vista and later.
     * @param {Pointer<ILocator>} pILocator Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ilocator">ILocator</a> interface of the locator object. The caller must release the interface.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-getcurrentlocator
     */
    GetCurrentLocator(pILocator) {
        result := ComCall(18, this, "ptr*", pILocator, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
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
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-performexhaustivescan
     */
    PerformExhaustiveScan(dwLowerFreq, dwHigherFreq, bFineTune, hEvent) {
        result := ComCall(19, this, "int", dwLowerFreq, "int", dwHigherFreq, "short", bFineTune, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @returns {Integer} Receives the last frequency that the tuner scanned before halting.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-terminatecurrentscan
     */
    TerminateCurrentScan() {
        result := ComCall(20, this, "int*", &pcurrentFreq := 0, "HRESULT")
        return pcurrentFreq
    }

    /**
     * This topic applies to Windows Vista and later.
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
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-resumecurrentscan
     */
    ResumeCurrentScan(hEvent) {
        result := ComCall(21, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Pointer<Integer>} HardwareAssistedScanning Receives a Boolean value. If the value is <b>TRUE</b>, the scanning algorithm is implemented entirely by the tuner hardware. Otherwise, the tuner filter implements part of the scanning algorithm in software.
     * @param {Pointer<Integer>} NumStandardsSupported Receives the number of broadcast standards supported by the tuner.
     * @param {Pointer<Guid>} BroadcastStandards Pointer to an array of GUIDs. The array must be large enough to hold a number of elements equal to the value returned in the <i>NumStandardsSupported</i> parameter. To find the required array size, call the method once and set this parameter to <b>NULL</b>. Then allocate the array and call the method again, setting this parameter to the address of the array.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-gettunerscanningcapability
     */
    GetTunerScanningCapability(HardwareAssistedScanning, NumStandardsSupported, BroadcastStandards) {
        HardwareAssistedScanningMarshal := HardwareAssistedScanning is VarRef ? "int*" : "ptr"
        NumStandardsSupportedMarshal := NumStandardsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, HardwareAssistedScanningMarshal, HardwareAssistedScanning, NumStandardsSupportedMarshal, NumStandardsSupported, "ptr", BroadcastStandards, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Pointer<Integer>} SecondsLeft Receives the estimated number of seconds remaining for the scan to complete.
     * @param {Pointer<Integer>} CurrentLockType Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/tunerlocktype">TunerLockType</a> enumeration, indicating how well the tuner locked onto a signal.
     * @param {Pointer<Integer>} AutoDetect Receives a Boolean value. If the value is <b>TRUE</b>, the tuner is in auto-detect mode.
     * @param {Pointer<Integer>} CurrentFreq Receives the frequency that was most recently scanned.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-gettunerstatus
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
     * @param {Pointer<Integer>} TvStandardsSupported If <i>CurrentBroadcastStandard</i> is ANALOG_TV_NETWORK_TYPE, this parameter receives a bitwise OR of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration, indicating which analog television formats are supported by the tuner. Otherwise, this parameter is ignored.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-getcurrenttunerstandardcapability
     */
    GetCurrentTunerStandardCapability(CurrentBroadcastStandard, SettlingTime, TvStandardsSupported) {
        SettlingTimeMarshal := SettlingTime is VarRef ? "int*" : "ptr"
        TvStandardsSupportedMarshal := TvStandardsSupported is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "ptr", CurrentBroadcastStandard, SettlingTimeMarshal, SettlingTime, TvStandardsSupportedMarshal, TvStandardsSupported, "HRESULT")
        return result
    }

    /**
     * This topic applies to Windows Vista and later.
     * @param {Integer} ScanModulationTypes Specifies the modulation types, as a bitwise OR of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/scanmodulationtypes">ScanModulationTypes</a> enumeration. If the value is 0xFFFFFFFF, the tuner does not filter out any specific modulation types.
     * @param {Integer} AnalogVideoStandard Specifies the analog standards, as a bitwise OR of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration. If the value is 0xFFFFFFFF, the tuner does not filter out any specific analog video standards.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtunerex-setscansignaltypefilter
     */
    SetScanSignalTypeFilter(ScanModulationTypes, AnalogVideoStandard) {
        result := ComCall(25, this, "int", ScanModulationTypes, "int", AnalogVideoStandard, "HRESULT")
        return result
    }
}
