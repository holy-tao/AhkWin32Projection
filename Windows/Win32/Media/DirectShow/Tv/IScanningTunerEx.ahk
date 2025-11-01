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
     * 
     * @param {Pointer<ILocator>} pILocator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-getcurrentlocator
     */
    GetCurrentLocator(pILocator) {
        result := ComCall(18, this, "ptr*", pILocator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwLowerFreq 
     * @param {Integer} dwHigherFreq 
     * @param {VARIANT_BOOL} bFineTune 
     * @param {Pointer} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-performexhaustivescan
     */
    PerformExhaustiveScan(dwLowerFreq, dwHigherFreq, bFineTune, hEvent) {
        result := ComCall(19, this, "int", dwLowerFreq, "int", dwHigherFreq, "short", bFineTune, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcurrentFreq 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-terminatecurrentscan
     */
    TerminateCurrentScan(pcurrentFreq) {
        result := ComCall(20, this, "int*", pcurrentFreq, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hEvent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-resumecurrentscan
     */
    ResumeCurrentScan(hEvent) {
        result := ComCall(21, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HardwareAssistedScanning 
     * @param {Pointer<Integer>} NumStandardsSupported 
     * @param {Pointer<Guid>} BroadcastStandards 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-gettunerscanningcapability
     */
    GetTunerScanningCapability(HardwareAssistedScanning, NumStandardsSupported, BroadcastStandards) {
        result := ComCall(22, this, "int*", HardwareAssistedScanning, "int*", NumStandardsSupported, "ptr", BroadcastStandards, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SecondsLeft 
     * @param {Pointer<Integer>} CurrentLockType 
     * @param {Pointer<Integer>} AutoDetect 
     * @param {Pointer<Integer>} CurrentFreq 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-gettunerstatus
     */
    GetTunerStatus(SecondsLeft, CurrentLockType, AutoDetect, CurrentFreq) {
        result := ComCall(23, this, "int*", SecondsLeft, "int*", CurrentLockType, "int*", AutoDetect, "int*", CurrentFreq, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} CurrentBroadcastStandard 
     * @param {Pointer<Integer>} SettlingTime 
     * @param {Pointer<Integer>} TvStandardsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-getcurrenttunerstandardcapability
     */
    GetCurrentTunerStandardCapability(CurrentBroadcastStandard, SettlingTime, TvStandardsSupported) {
        result := ComCall(24, this, "ptr", CurrentBroadcastStandard, "int*", SettlingTime, "int*", TvStandardsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ScanModulationTypes 
     * @param {Integer} AnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtunerex-setscansignaltypefilter
     */
    SetScanSignalTypeFilter(ScanModulationTypes, AnalogVideoStandard) {
        result := ComCall(25, this, "int", ScanModulationTypes, "int", AnalogVideoStandard, "HRESULT")
        return result
    }
}
