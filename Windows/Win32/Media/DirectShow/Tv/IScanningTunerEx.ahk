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
     * 
     * @param {Pointer<ILocator>} pILocator 
     * @returns {HRESULT} 
     */
    GetCurrentLocator(pILocator) {
        result := ComCall(18, this, "ptr", pILocator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwLowerFreq 
     * @param {Integer} dwHigherFreq 
     * @param {VARIANT_BOOL} bFineTune 
     * @param {Pointer} hEvent 
     * @returns {HRESULT} 
     */
    PerformExhaustiveScan(dwLowerFreq, dwHigherFreq, bFineTune, hEvent) {
        result := ComCall(19, this, "int", dwLowerFreq, "int", dwHigherFreq, "short", bFineTune, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcurrentFreq 
     * @returns {HRESULT} 
     */
    TerminateCurrentScan(pcurrentFreq) {
        result := ComCall(20, this, "int*", pcurrentFreq, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hEvent 
     * @returns {HRESULT} 
     */
    ResumeCurrentScan(hEvent) {
        result := ComCall(21, this, "ptr", hEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HardwareAssistedScanning 
     * @param {Pointer<Int32>} NumStandardsSupported 
     * @param {Pointer<Guid>} BroadcastStandards 
     * @returns {HRESULT} 
     */
    GetTunerScanningCapability(HardwareAssistedScanning, NumStandardsSupported, BroadcastStandards) {
        result := ComCall(22, this, "int*", HardwareAssistedScanning, "int*", NumStandardsSupported, "ptr", BroadcastStandards, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} SecondsLeft 
     * @param {Pointer<Int32>} CurrentLockType 
     * @param {Pointer<Int32>} AutoDetect 
     * @param {Pointer<Int32>} CurrentFreq 
     * @returns {HRESULT} 
     */
    GetTunerStatus(SecondsLeft, CurrentLockType, AutoDetect, CurrentFreq) {
        result := ComCall(23, this, "int*", SecondsLeft, "int*", CurrentLockType, "int*", AutoDetect, "int*", CurrentFreq, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CurrentBroadcastStandard 
     * @param {Pointer<Int32>} SettlingTime 
     * @param {Pointer<Int32>} TvStandardsSupported 
     * @returns {HRESULT} 
     */
    GetCurrentTunerStandardCapability(CurrentBroadcastStandard, SettlingTime, TvStandardsSupported) {
        result := ComCall(24, this, "ptr", CurrentBroadcastStandard, "int*", SettlingTime, "int*", TvStandardsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ScanModulationTypes 
     * @param {Integer} AnalogVideoStandard 
     * @returns {HRESULT} 
     */
    SetScanSignalTypeFilter(ScanModulationTypes, AnalogVideoStandard) {
        result := ComCall(25, this, "int", ScanModulationTypes, "int", AnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
