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
     * @type {VARIANT_BOOL} 
     */
    EnableDigitGrouping {
        get => this.get_EnableDigitGrouping()
        set => this.put_EnableDigitGrouping(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableToolTips {
        get => this.get_EnableToolTips()
        set => this.put_EnableToolTips(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowTimeAxisLabels {
        get => this.get_ShowTimeAxisLabels()
        set => this.put_ShowTimeAxisLabels(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ChartScroll {
        get => this.get_ChartScroll()
        set => this.put_ChartScroll(value)
    }

    /**
     * @type {Integer} 
     */
    DataPointCount {
        get => this.get_DataPointCount()
        set => this.put_DataPointCount(value)
    }

    /**
     * @type {Float} 
     */
    LogSourceStartTime {
        get => this.get_LogSourceStartTime()
    }

    /**
     * @type {Float} 
     */
    LogSourceStopTime {
        get => this.get_LogSourceStopTime()
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_EnableDigitGrouping(bState) {
        result := ComCall(79, this, "short", bState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_EnableDigitGrouping() {
        result := ComCall(80, this, "short*", &pbState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_EnableToolTips(bState) {
        result := ComCall(81, this, "short", bState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_EnableToolTips() {
        result := ComCall(82, this, "short*", &pbState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowTimeAxisLabels(bState) {
        result := ComCall(83, this, "short", bState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowTimeAxisLabels() {
        result := ComCall(84, this, "short*", &pbState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bScroll 
     * @returns {HRESULT} 
     */
    put_ChartScroll(bScroll) {
        result := ComCall(85, this, "short", bScroll, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ChartScroll() {
        result := ComCall(86, this, "short*", &pbScroll := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbScroll
    }

    /**
     * 
     * @param {Integer} iNewCount 
     * @returns {HRESULT} 
     */
    put_DataPointCount(iNewCount) {
        result := ComCall(87, this, "int", iNewCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataPointCount() {
        result := ComCall(88, this, "int*", &piDataPointCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piDataPointCount
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSelectedCountersOnly 
     * @returns {HRESULT} 
     */
    ScaleToFit(bSelectedCountersOnly) {
        result := ComCall(89, this, "short", bSelectedCountersOnly, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {Integer} eSysmonFileType 
     * @returns {HRESULT} 
     */
    SaveAs(bstrFileName, eSysmonFileType) {
        if(bstrFileName is String) {
            pin := BSTR.Alloc(bstrFileName)
            bstrFileName := pin.Value
        }

        result := ComCall(90, this, "ptr", bstrFileName, "int", eSysmonFileType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {Integer} eSysmonFileType 
     * @param {Integer} iFilter_ 
     * @returns {HRESULT} 
     */
    Relog(bstrFileName, eSysmonFileType, iFilter_) {
        if(bstrFileName is String) {
            pin := BSTR.Alloc(bstrFileName)
            bstrFileName := pin.Value
        }

        result := ComCall(91, this, "ptr", bstrFileName, "int", eSysmonFileType, "int", iFilter_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearData() {
        result := ComCall(92, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogSourceStartTime() {
        result := ComCall(93, this, "double*", &pDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogSourceStopTime() {
        result := ComCall(94, this, "double*", &pDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDate
    }

    /**
     * 
     * @param {Float} StartTime 
     * @param {Float} StopTime 
     * @returns {HRESULT} 
     */
    SetLogViewRange(StartTime, StopTime) {
        result := ComCall(95, this, "double", StartTime, "double", StopTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Float>} StartTime 
     * @param {Pointer<Float>} StopTime 
     * @returns {HRESULT} 
     */
    GetLogViewRange(StartTime, StopTime) {
        StartTimeMarshal := StartTime is VarRef ? "double*" : "ptr"
        StopTimeMarshal := StopTime is VarRef ? "double*" : "ptr"

        result := ComCall(96, this, StartTimeMarshal, StartTime, StopTimeMarshal, StopTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fLock 
     * @param {Integer} eBatchReason 
     * @returns {HRESULT} 
     */
    BatchingLock(fLock, eBatchReason) {
        result := ComCall(97, this, "short", fLock, "int", eBatchReason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSettingFileName 
     * @returns {HRESULT} 
     */
    LoadSettings(bstrSettingFileName) {
        if(bstrSettingFileName is String) {
            pin := BSTR.Alloc(bstrSettingFileName)
            bstrSettingFileName := pin.Value
        }

        result := ComCall(98, this, "ptr", bstrSettingFileName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
