#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISystemMonitor.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ISystemMonitor2 extends ISystemMonitor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMonitor2
     * @type {Guid}
     */
    static IID => Guid("{08e3206a-5fd2-4fde-a8a5-8cb3b63d2677}")

    /**
     * The class identifier for SystemMonitor2
     * @type {Guid}
     */
    static CLSID => Guid("{7f30578c-5f38-4612-acfe-6ed04c7b7af8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 79

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_EnableDigitGrouping", "get_EnableDigitGrouping", "put_EnableToolTips", "get_EnableToolTips", "put_ShowTimeAxisLabels", "get_ShowTimeAxisLabels", "put_ChartScroll", "get_ChartScroll", "put_DataPointCount", "get_DataPointCount", "ScaleToFit", "SaveAs", "Relog", "ClearData", "get_LogSourceStartTime", "get_LogSourceStopTime", "SetLogViewRange", "GetLogViewRange", "BatchingLock", "LoadSettings"]

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_EnableDigitGrouping(bState) {
        result := ComCall(79, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_EnableDigitGrouping(pbState) {
        result := ComCall(80, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_EnableToolTips(bState) {
        result := ComCall(81, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_EnableToolTips(pbState) {
        result := ComCall(82, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowTimeAxisLabels(bState) {
        result := ComCall(83, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowTimeAxisLabels(pbState) {
        result := ComCall(84, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bScroll 
     * @returns {HRESULT} 
     */
    put_ChartScroll(bScroll) {
        result := ComCall(85, this, "short", bScroll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbScroll 
     * @returns {HRESULT} 
     */
    get_ChartScroll(pbScroll) {
        result := ComCall(86, this, "ptr", pbScroll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iNewCount 
     * @returns {HRESULT} 
     */
    put_DataPointCount(iNewCount) {
        result := ComCall(87, this, "int", iNewCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piDataPointCount 
     * @returns {HRESULT} 
     */
    get_DataPointCount(piDataPointCount) {
        result := ComCall(88, this, "int*", piDataPointCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSelectedCountersOnly 
     * @returns {HRESULT} 
     */
    ScaleToFit(bSelectedCountersOnly) {
        result := ComCall(89, this, "short", bSelectedCountersOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {Integer} eSysmonFileType 
     * @returns {HRESULT} 
     */
    SaveAs(bstrFileName, eSysmonFileType) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(90, this, "ptr", bstrFileName, "int", eSysmonFileType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {Integer} eSysmonFileType 
     * @param {Integer} iFilter 
     * @returns {HRESULT} 
     */
    Relog(bstrFileName, eSysmonFileType, iFilter) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(91, this, "ptr", bstrFileName, "int", eSysmonFileType, "int", iFilter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearData() {
        result := ComCall(92, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     */
    get_LogSourceStartTime(pDate) {
        result := ComCall(93, this, "double*", pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     */
    get_LogSourceStopTime(pDate) {
        result := ComCall(94, this, "double*", pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} StartTime 
     * @param {Float} StopTime 
     * @returns {HRESULT} 
     */
    SetLogViewRange(StartTime, StopTime) {
        result := ComCall(95, this, "double", StartTime, "double", StopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} StartTime 
     * @param {Pointer<Float>} StopTime 
     * @returns {HRESULT} 
     */
    GetLogViewRange(StartTime, StopTime) {
        result := ComCall(96, this, "double*", StartTime, "double*", StopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fLock 
     * @param {Integer} eBatchReason 
     * @returns {HRESULT} 
     */
    BatchingLock(fLock, eBatchReason) {
        result := ComCall(97, this, "short", fLock, "int", eBatchReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSettingFileName 
     * @returns {HRESULT} 
     */
    LoadSettings(bstrSettingFileName) {
        bstrSettingFileName := bstrSettingFileName is String ? BSTR.Alloc(bstrSettingFileName).Value : bstrSettingFileName

        result := ComCall(98, this, "ptr", bstrSettingFileName, "HRESULT")
        return result
    }
}
