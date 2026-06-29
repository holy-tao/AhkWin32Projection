#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SysmonBatchReason.ahk" { SysmonBatchReason }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SysmonFileType.ahk" { SysmonFileType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ISystemMonitor.ahk" { ISystemMonitor }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct ISystemMonitor2 extends ISystemMonitor {
    /**
     * The interface identifier for ISystemMonitor2
     * @type {Guid}
     */
    static IID := Guid("{08e3206a-5fd2-4fde-a8a5-8cb3b63d2677}")

    /**
     * The class identifier for SystemMonitor2
     * @type {Guid}
     */
    static CLSID := Guid("{7f30578c-5f38-4612-acfe-6ed04c7b7af8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISystemMonitor2 interfaces
    */
    struct Vtbl extends ISystemMonitor.Vtbl {
        put_EnableDigitGrouping : IntPtr
        get_EnableDigitGrouping : IntPtr
        put_EnableToolTips      : IntPtr
        get_EnableToolTips      : IntPtr
        put_ShowTimeAxisLabels  : IntPtr
        get_ShowTimeAxisLabels  : IntPtr
        put_ChartScroll         : IntPtr
        get_ChartScroll         : IntPtr
        put_DataPointCount      : IntPtr
        get_DataPointCount      : IntPtr
        ScaleToFit              : IntPtr
        SaveAs                  : IntPtr
        Relog                   : IntPtr
        ClearData               : IntPtr
        get_LogSourceStartTime  : IntPtr
        get_LogSourceStopTime   : IntPtr
        SetLogViewRange         : IntPtr
        GetLogViewRange         : IntPtr
        BatchingLock            : IntPtr
        LoadSettings            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISystemMonitor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(79, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_EnableDigitGrouping() {
        result := ComCall(80, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_EnableToolTips(bState) {
        result := ComCall(81, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_EnableToolTips() {
        result := ComCall(82, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowTimeAxisLabels(bState) {
        result := ComCall(83, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowTimeAxisLabels() {
        result := ComCall(84, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bScroll 
     * @returns {HRESULT} 
     */
    put_ChartScroll(bScroll) {
        result := ComCall(85, this, VARIANT_BOOL, bScroll, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ChartScroll() {
        result := ComCall(86, this, VARIANT_BOOL.Ptr, &pbScroll := 0, "HRESULT")
        return pbScroll
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
     * @returns {Integer} 
     */
    get_DataPointCount() {
        result := ComCall(88, this, "int*", &piDataPointCount := 0, "HRESULT")
        return piDataPointCount
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSelectedCountersOnly 
     * @returns {HRESULT} 
     */
    ScaleToFit(bSelectedCountersOnly) {
        result := ComCall(89, this, VARIANT_BOOL, bSelectedCountersOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {SysmonFileType} eSysmonFileType 
     * @returns {HRESULT} 
     */
    SaveAs(bstrFileName, eSysmonFileType) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(90, this, BSTR, bstrFileName, SysmonFileType, eSysmonFileType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {SysmonFileType} eSysmonFileType 
     * @param {Integer} _iFilter 
     * @returns {HRESULT} 
     */
    Relog(bstrFileName, eSysmonFileType, _iFilter) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName

        result := ComCall(91, this, BSTR, bstrFileName, SysmonFileType, eSysmonFileType, "int", _iFilter, "HRESULT")
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
     * @returns {Float} 
     */
    get_LogSourceStartTime() {
        result := ComCall(93, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogSourceStopTime() {
        result := ComCall(94, this, "double*", &pDate := 0, "HRESULT")
        return pDate
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
        StartTimeMarshal := StartTime is VarRef ? "double*" : "ptr"
        StopTimeMarshal := StopTime is VarRef ? "double*" : "ptr"

        result := ComCall(96, this, StartTimeMarshal, StartTime, StopTimeMarshal, StopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fLock 
     * @param {SysmonBatchReason} eBatchReason 
     * @returns {HRESULT} 
     */
    BatchingLock(fLock, eBatchReason) {
        result := ComCall(97, this, VARIANT_BOOL, fLock, SysmonBatchReason, eBatchReason, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSettingFileName 
     * @returns {HRESULT} 
     */
    LoadSettings(bstrSettingFileName) {
        bstrSettingFileName := bstrSettingFileName is String ? BSTR.Alloc(bstrSettingFileName).Value : bstrSettingFileName

        result := ComCall(98, this, BSTR, bstrSettingFileName, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISystemMonitor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_EnableDigitGrouping := CallbackCreate(GetMethod(implObj, "put_EnableDigitGrouping"), flags, 2)
        this.vtbl.get_EnableDigitGrouping := CallbackCreate(GetMethod(implObj, "get_EnableDigitGrouping"), flags, 2)
        this.vtbl.put_EnableToolTips := CallbackCreate(GetMethod(implObj, "put_EnableToolTips"), flags, 2)
        this.vtbl.get_EnableToolTips := CallbackCreate(GetMethod(implObj, "get_EnableToolTips"), flags, 2)
        this.vtbl.put_ShowTimeAxisLabels := CallbackCreate(GetMethod(implObj, "put_ShowTimeAxisLabels"), flags, 2)
        this.vtbl.get_ShowTimeAxisLabels := CallbackCreate(GetMethod(implObj, "get_ShowTimeAxisLabels"), flags, 2)
        this.vtbl.put_ChartScroll := CallbackCreate(GetMethod(implObj, "put_ChartScroll"), flags, 2)
        this.vtbl.get_ChartScroll := CallbackCreate(GetMethod(implObj, "get_ChartScroll"), flags, 2)
        this.vtbl.put_DataPointCount := CallbackCreate(GetMethod(implObj, "put_DataPointCount"), flags, 2)
        this.vtbl.get_DataPointCount := CallbackCreate(GetMethod(implObj, "get_DataPointCount"), flags, 2)
        this.vtbl.ScaleToFit := CallbackCreate(GetMethod(implObj, "ScaleToFit"), flags, 2)
        this.vtbl.SaveAs := CallbackCreate(GetMethod(implObj, "SaveAs"), flags, 3)
        this.vtbl.Relog := CallbackCreate(GetMethod(implObj, "Relog"), flags, 4)
        this.vtbl.ClearData := CallbackCreate(GetMethod(implObj, "ClearData"), flags, 1)
        this.vtbl.get_LogSourceStartTime := CallbackCreate(GetMethod(implObj, "get_LogSourceStartTime"), flags, 2)
        this.vtbl.get_LogSourceStopTime := CallbackCreate(GetMethod(implObj, "get_LogSourceStopTime"), flags, 2)
        this.vtbl.SetLogViewRange := CallbackCreate(GetMethod(implObj, "SetLogViewRange"), flags, 3)
        this.vtbl.GetLogViewRange := CallbackCreate(GetMethod(implObj, "GetLogViewRange"), flags, 3)
        this.vtbl.BatchingLock := CallbackCreate(GetMethod(implObj, "BatchingLock"), flags, 3)
        this.vtbl.LoadSettings := CallbackCreate(GetMethod(implObj, "LoadSettings"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_EnableDigitGrouping)
        CallbackFree(this.vtbl.get_EnableDigitGrouping)
        CallbackFree(this.vtbl.put_EnableToolTips)
        CallbackFree(this.vtbl.get_EnableToolTips)
        CallbackFree(this.vtbl.put_ShowTimeAxisLabels)
        CallbackFree(this.vtbl.get_ShowTimeAxisLabels)
        CallbackFree(this.vtbl.put_ChartScroll)
        CallbackFree(this.vtbl.get_ChartScroll)
        CallbackFree(this.vtbl.put_DataPointCount)
        CallbackFree(this.vtbl.get_DataPointCount)
        CallbackFree(this.vtbl.ScaleToFit)
        CallbackFree(this.vtbl.SaveAs)
        CallbackFree(this.vtbl.Relog)
        CallbackFree(this.vtbl.ClearData)
        CallbackFree(this.vtbl.get_LogSourceStartTime)
        CallbackFree(this.vtbl.get_LogSourceStopTime)
        CallbackFree(this.vtbl.SetLogViewRange)
        CallbackFree(this.vtbl.GetLogViewRange)
        CallbackFree(this.vtbl.BatchingLock)
        CallbackFree(this.vtbl.LoadSettings)
    }
}
