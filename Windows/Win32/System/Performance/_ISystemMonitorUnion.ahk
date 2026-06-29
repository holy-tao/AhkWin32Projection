#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ReportValueTypeConstants.ahk" { ReportValueTypeConstants }
#Import ".\SysmonFileType.ahk" { SysmonFileType }
#Import ".\DataSourceTypeConstants.ahk" { DataSourceTypeConstants }
#Import ".\SysmonBatchReason.ahk" { SysmonBatchReason }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DisplayTypeConstants.ahk" { DisplayTypeConstants }
#Import ".\ICounters.ahk" { ICounters }
#Import ".\ICounterItem.ahk" { ICounterItem }
#Import "..\Ole\IFontDisp.ahk" { IFontDisp }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ILogFiles.ahk" { ILogFiles }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct _ISystemMonitorUnion extends IUnknown {
    /**
     * The interface identifier for _ISystemMonitorUnion
     * @type {Guid}
     */
    static IID := Guid("{c8a77338-265f-4de5-aa25-c7da1ce5a8f4}")

    /**
     * The class identifier for _ISystemMonitorUnion
     * @type {Guid}
     */
    static CLSID := Guid("{c8a77338-265f-4de5-aa25-c7da1ce5a8f4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _ISystemMonitorUnion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Appearance                : IntPtr
        put_Appearance                : IntPtr
        get_BackColor                 : IntPtr
        put_BackColor                 : IntPtr
        get_BorderStyle               : IntPtr
        put_BorderStyle               : IntPtr
        get_ForeColor                 : IntPtr
        put_ForeColor                 : IntPtr
        get_Font                      : IntPtr
        putref_Font                   : IntPtr
        get_Counters                  : IntPtr
        put_ShowVerticalGrid          : IntPtr
        get_ShowVerticalGrid          : IntPtr
        put_ShowHorizontalGrid        : IntPtr
        get_ShowHorizontalGrid        : IntPtr
        put_ShowLegend                : IntPtr
        get_ShowLegend                : IntPtr
        put_ShowScaleLabels           : IntPtr
        get_ShowScaleLabels           : IntPtr
        put_ShowValueBar              : IntPtr
        get_ShowValueBar              : IntPtr
        put_MaximumScale              : IntPtr
        get_MaximumScale              : IntPtr
        put_MinimumScale              : IntPtr
        get_MinimumScale              : IntPtr
        put_UpdateInterval            : IntPtr
        get_UpdateInterval            : IntPtr
        put_DisplayType               : IntPtr
        get_DisplayType               : IntPtr
        put_ManualUpdate              : IntPtr
        get_ManualUpdate              : IntPtr
        put_GraphTitle                : IntPtr
        get_GraphTitle                : IntPtr
        put_YAxisLabel                : IntPtr
        get_YAxisLabel                : IntPtr
        CollectSample                 : IntPtr
        UpdateGraph                   : IntPtr
        BrowseCounters                : IntPtr
        DisplayProperties             : IntPtr
        Counter                       : IntPtr
        AddCounter                    : IntPtr
        DeleteCounter                 : IntPtr
        get_BackColorCtl              : IntPtr
        put_BackColorCtl              : IntPtr
        put_LogFileName               : IntPtr
        get_LogFileName               : IntPtr
        put_LogViewStart              : IntPtr
        get_LogViewStart              : IntPtr
        put_LogViewStop               : IntPtr
        get_LogViewStop               : IntPtr
        get_GridColor                 : IntPtr
        put_GridColor                 : IntPtr
        get_TimeBarColor              : IntPtr
        put_TimeBarColor              : IntPtr
        get_Highlight                 : IntPtr
        put_Highlight                 : IntPtr
        get_ShowToolbar               : IntPtr
        put_ShowToolbar               : IntPtr
        Paste                         : IntPtr
        Copy                          : IntPtr
        Reset                         : IntPtr
        put_ReadOnly                  : IntPtr
        get_ReadOnly                  : IntPtr
        put_ReportValueType           : IntPtr
        get_ReportValueType           : IntPtr
        put_MonitorDuplicateInstances : IntPtr
        get_MonitorDuplicateInstances : IntPtr
        put_DisplayFilter             : IntPtr
        get_DisplayFilter             : IntPtr
        get_LogFiles                  : IntPtr
        put_DataSourceType            : IntPtr
        get_DataSourceType            : IntPtr
        put_SqlDsnName                : IntPtr
        get_SqlDsnName                : IntPtr
        put_SqlLogSetName             : IntPtr
        get_SqlLogSetName             : IntPtr
        put_EnableDigitGrouping       : IntPtr
        get_EnableDigitGrouping       : IntPtr
        put_EnableToolTips            : IntPtr
        get_EnableToolTips            : IntPtr
        put_ShowTimeAxisLabels        : IntPtr
        get_ShowTimeAxisLabels        : IntPtr
        put_ChartScroll               : IntPtr
        get_ChartScroll               : IntPtr
        put_DataPointCount            : IntPtr
        get_DataPointCount            : IntPtr
        ScaleToFit                    : IntPtr
        SaveAs                        : IntPtr
        Relog                         : IntPtr
        ClearData                     : IntPtr
        get_LogSourceStartTime        : IntPtr
        get_LogSourceStopTime         : IntPtr
        SetLogViewRange               : IntPtr
        GetLogViewRange               : IntPtr
        BatchingLock                  : IntPtr
        LoadSettings                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _ISystemMonitorUnion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Appearance {
        get => this.get_Appearance()
        set => this.put_Appearance(value)
    }

    /**
     * @type {Integer} 
     */
    BackColor {
        get => this.get_BackColor()
        set => this.put_BackColor(value)
    }

    /**
     * @type {Integer} 
     */
    BorderStyle {
        get => this.get_BorderStyle()
        set => this.put_BorderStyle(value)
    }

    /**
     * @type {Integer} 
     */
    ForeColor {
        get => this.get_ForeColor()
        set => this.put_ForeColor(value)
    }

    /**
     * @type {IFontDisp} 
     */
    Font {
        get => this.get_Font()
    }

    /**
     * @type {ICounters} 
     */
    Counters {
        get => this.get_Counters()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowVerticalGrid {
        get => this.get_ShowVerticalGrid()
        set => this.put_ShowVerticalGrid(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowHorizontalGrid {
        get => this.get_ShowHorizontalGrid()
        set => this.put_ShowHorizontalGrid(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowLegend {
        get => this.get_ShowLegend()
        set => this.put_ShowLegend(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowScaleLabels {
        get => this.get_ShowScaleLabels()
        set => this.put_ShowScaleLabels(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowValueBar {
        get => this.get_ShowValueBar()
        set => this.put_ShowValueBar(value)
    }

    /**
     * @type {Integer} 
     */
    MaximumScale {
        get => this.get_MaximumScale()
        set => this.put_MaximumScale(value)
    }

    /**
     * @type {Integer} 
     */
    MinimumScale {
        get => this.get_MinimumScale()
        set => this.put_MinimumScale(value)
    }

    /**
     * @type {Float} 
     */
    UpdateInterval {
        get => this.get_UpdateInterval()
        set => this.put_UpdateInterval(value)
    }

    /**
     * @type {DisplayTypeConstants} 
     */
    DisplayType {
        get => this.get_DisplayType()
        set => this.put_DisplayType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ManualUpdate {
        get => this.get_ManualUpdate()
        set => this.put_ManualUpdate(value)
    }

    /**
     * @type {BSTR} 
     */
    GraphTitle {
        get => this.get_GraphTitle()
        set => this.put_GraphTitle(value)
    }

    /**
     * @type {BSTR} 
     */
    YAxisLabel {
        get => this.get_YAxisLabel()
        set => this.put_YAxisLabel(value)
    }

    /**
     * @type {Integer} 
     */
    BackColorCtl {
        get => this.get_BackColorCtl()
        set => this.put_BackColorCtl(value)
    }

    /**
     * @type {BSTR} 
     */
    LogFileName {
        get => this.get_LogFileName()
        set => this.put_LogFileName(value)
    }

    /**
     * @type {Float} 
     */
    LogViewStart {
        get => this.get_LogViewStart()
        set => this.put_LogViewStart(value)
    }

    /**
     * @type {Float} 
     */
    LogViewStop {
        get => this.get_LogViewStop()
        set => this.put_LogViewStop(value)
    }

    /**
     * @type {Integer} 
     */
    GridColor {
        get => this.get_GridColor()
        set => this.put_GridColor(value)
    }

    /**
     * @type {Integer} 
     */
    TimeBarColor {
        get => this.get_TimeBarColor()
        set => this.put_TimeBarColor(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Highlight {
        get => this.get_Highlight()
        set => this.put_Highlight(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ShowToolbar {
        get => this.get_ShowToolbar()
        set => this.put_ShowToolbar(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
        set => this.put_ReadOnly(value)
    }

    /**
     * @type {ReportValueTypeConstants} 
     */
    ReportValueType {
        get => this.get_ReportValueType()
        set => this.put_ReportValueType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MonitorDuplicateInstances {
        get => this.get_MonitorDuplicateInstances()
        set => this.put_MonitorDuplicateInstances(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayFilter {
        get => this.get_DisplayFilter()
        set => this.put_DisplayFilter(value)
    }

    /**
     * @type {ILogFiles} 
     */
    LogFiles {
        get => this.get_LogFiles()
    }

    /**
     * @type {DataSourceTypeConstants} 
     */
    DataSourceType {
        get => this.get_DataSourceType()
        set => this.put_DataSourceType(value)
    }

    /**
     * @type {BSTR} 
     */
    SqlDsnName {
        get => this.get_SqlDsnName()
        set => this.put_SqlDsnName(value)
    }

    /**
     * @type {BSTR} 
     */
    SqlLogSetName {
        get => this.get_SqlLogSetName()
        set => this.put_SqlLogSetName(value)
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
     * @returns {Integer} 
     */
    get_Appearance() {
        result := ComCall(3, this, "int*", &iAppearance := 0, "HRESULT")
        return iAppearance
    }

    /**
     * 
     * @param {Integer} iAppearance 
     * @returns {HRESULT} 
     */
    put_Appearance(iAppearance) {
        result := ComCall(4, this, "int", iAppearance, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackColor() {
        result := ComCall(5, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_BackColor(_Color) {
        result := ComCall(6, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BorderStyle() {
        result := ComCall(7, this, "int*", &iBorderStyle := 0, "HRESULT")
        return iBorderStyle
    }

    /**
     * 
     * @param {Integer} iBorderStyle 
     * @returns {HRESULT} 
     */
    put_BorderStyle(iBorderStyle) {
        result := ComCall(8, this, "int", iBorderStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ForeColor() {
        result := ComCall(9, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_ForeColor(_Color) {
        result := ComCall(10, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IFontDisp} 
     */
    get_Font() {
        result := ComCall(11, this, "ptr*", &ppFont := 0, "HRESULT")
        return IFontDisp(ppFont)
    }

    /**
     * 
     * @param {IFontDisp} pFont 
     * @returns {HRESULT} 
     */
    putref_Font(pFont) {
        result := ComCall(12, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICounters} 
     */
    get_Counters() {
        result := ComCall(13, this, "ptr*", &ppICounters := 0, "HRESULT")
        return ICounters(ppICounters)
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowVerticalGrid(bState) {
        result := ComCall(14, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowVerticalGrid() {
        result := ComCall(15, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowHorizontalGrid(bState) {
        result := ComCall(16, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowHorizontalGrid() {
        result := ComCall(17, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowLegend(bState) {
        result := ComCall(18, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowLegend() {
        result := ComCall(19, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowScaleLabels(bState) {
        result := ComCall(20, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowScaleLabels() {
        result := ComCall(21, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowValueBar(bState) {
        result := ComCall(22, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowValueBar() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {Integer} iValue 
     * @returns {HRESULT} 
     */
    put_MaximumScale(iValue) {
        result := ComCall(24, this, "int", iValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumScale() {
        result := ComCall(25, this, "int*", &piValue := 0, "HRESULT")
        return piValue
    }

    /**
     * 
     * @param {Integer} iValue 
     * @returns {HRESULT} 
     */
    put_MinimumScale(iValue) {
        result := ComCall(26, this, "int", iValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumScale() {
        result := ComCall(27, this, "int*", &piValue := 0, "HRESULT")
        return piValue
    }

    /**
     * 
     * @param {Float} fValue 
     * @returns {HRESULT} 
     */
    put_UpdateInterval(fValue) {
        result := ComCall(28, this, "float", fValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UpdateInterval() {
        result := ComCall(29, this, "float*", &pfValue := 0, "HRESULT")
        return pfValue
    }

    /**
     * 
     * @param {DisplayTypeConstants} eDisplayType 
     * @returns {HRESULT} 
     */
    put_DisplayType(eDisplayType) {
        result := ComCall(30, this, DisplayTypeConstants, eDisplayType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DisplayTypeConstants} 
     */
    get_DisplayType() {
        result := ComCall(31, this, "int*", &peDisplayType := 0, "HRESULT")
        return peDisplayType
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ManualUpdate(bState) {
        result := ComCall(32, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ManualUpdate() {
        result := ComCall(33, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {BSTR} bsTitle 
     * @returns {HRESULT} 
     */
    put_GraphTitle(bsTitle) {
        bsTitle := bsTitle is String ? BSTR.Alloc(bsTitle).Value : bsTitle

        result := ComCall(34, this, BSTR, bsTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GraphTitle() {
        pbsTitle := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, pbsTitle, "HRESULT")
        return pbsTitle
    }

    /**
     * 
     * @param {BSTR} bsTitle 
     * @returns {HRESULT} 
     */
    put_YAxisLabel(bsTitle) {
        bsTitle := bsTitle is String ? BSTR.Alloc(bsTitle).Value : bsTitle

        result := ComCall(36, this, BSTR, bsTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_YAxisLabel() {
        pbsTitle := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, pbsTitle, "HRESULT")
        return pbsTitle
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CollectSample() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateGraph() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BrowseCounters() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayProperties() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @returns {ICounterItem} 
     */
    Counter(iIndex) {
        result := ComCall(42, this, "int", iIndex, "ptr*", &ppICounter := 0, "HRESULT")
        return ICounterItem(ppICounter)
    }

    /**
     * 
     * @param {BSTR} bsPath 
     * @returns {ICounterItem} 
     */
    AddCounter(bsPath) {
        bsPath := bsPath is String ? BSTR.Alloc(bsPath).Value : bsPath

        result := ComCall(43, this, BSTR, bsPath, "ptr*", &ppICounter := 0, "HRESULT")
        return ICounterItem(ppICounter)
    }

    /**
     * 
     * @param {ICounterItem} pCtr 
     * @returns {HRESULT} 
     */
    DeleteCounter(pCtr) {
        result := ComCall(44, this, "ptr", pCtr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackColorCtl() {
        result := ComCall(45, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_BackColorCtl(_Color) {
        result := ComCall(46, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsFileName 
     * @returns {HRESULT} 
     */
    put_LogFileName(bsFileName) {
        bsFileName := bsFileName is String ? BSTR.Alloc(bsFileName).Value : bsFileName

        result := ComCall(47, this, BSTR, bsFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LogFileName() {
        bsFileName := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, bsFileName, "HRESULT")
        return bsFileName
    }

    /**
     * 
     * @param {Float} StartTime 
     * @returns {HRESULT} 
     */
    put_LogViewStart(StartTime) {
        result := ComCall(49, this, "double", StartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogViewStart() {
        result := ComCall(50, this, "double*", &StartTime := 0, "HRESULT")
        return StartTime
    }

    /**
     * 
     * @param {Float} StopTime 
     * @returns {HRESULT} 
     */
    put_LogViewStop(StopTime) {
        result := ComCall(51, this, "double", StopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogViewStop() {
        result := ComCall(52, this, "double*", &StopTime := 0, "HRESULT")
        return StopTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GridColor() {
        result := ComCall(53, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_GridColor(_Color) {
        result := ComCall(54, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimeBarColor() {
        result := ComCall(55, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_TimeBarColor(_Color) {
        result := ComCall(56, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Highlight() {
        result := ComCall(57, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Highlight(bState) {
        result := ComCall(58, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowToolbar() {
        result := ComCall(59, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowToolbar(bState) {
        result := ComCall(60, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Paste() {
        result := ComCall(61, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Copy() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(63, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ReadOnly(bState) {
        result := ComCall(64, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ReadOnly() {
        result := ComCall(65, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {ReportValueTypeConstants} eReportValueType 
     * @returns {HRESULT} 
     */
    put_ReportValueType(eReportValueType) {
        result := ComCall(66, this, ReportValueTypeConstants, eReportValueType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ReportValueTypeConstants} 
     */
    get_ReportValueType() {
        result := ComCall(67, this, "int*", &peReportValueType := 0, "HRESULT")
        return peReportValueType
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_MonitorDuplicateInstances(bState) {
        result := ComCall(68, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MonitorDuplicateInstances() {
        result := ComCall(69, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {Integer} iValue 
     * @returns {HRESULT} 
     */
    put_DisplayFilter(iValue) {
        result := ComCall(70, this, "int", iValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayFilter() {
        result := ComCall(71, this, "int*", &piValue := 0, "HRESULT")
        return piValue
    }

    /**
     * 
     * @returns {ILogFiles} 
     */
    get_LogFiles() {
        result := ComCall(72, this, "ptr*", &ppILogFiles := 0, "HRESULT")
        return ILogFiles(ppILogFiles)
    }

    /**
     * 
     * @param {DataSourceTypeConstants} eDataSourceType 
     * @returns {HRESULT} 
     */
    put_DataSourceType(eDataSourceType) {
        result := ComCall(73, this, DataSourceTypeConstants, eDataSourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DataSourceTypeConstants} 
     */
    get_DataSourceType() {
        result := ComCall(74, this, "int*", &peDataSourceType := 0, "HRESULT")
        return peDataSourceType
    }

    /**
     * 
     * @param {BSTR} bsSqlDsnName 
     * @returns {HRESULT} 
     */
    put_SqlDsnName(bsSqlDsnName) {
        bsSqlDsnName := bsSqlDsnName is String ? BSTR.Alloc(bsSqlDsnName).Value : bsSqlDsnName

        result := ComCall(75, this, BSTR, bsSqlDsnName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SqlDsnName() {
        bsSqlDsnName := BSTR.Owned()
        result := ComCall(76, this, BSTR.Ptr, bsSqlDsnName, "HRESULT")
        return bsSqlDsnName
    }

    /**
     * 
     * @param {BSTR} bsSqlLogSetName 
     * @returns {HRESULT} 
     */
    put_SqlLogSetName(bsSqlLogSetName) {
        bsSqlLogSetName := bsSqlLogSetName is String ? BSTR.Alloc(bsSqlLogSetName).Value : bsSqlLogSetName

        result := ComCall(77, this, BSTR, bsSqlLogSetName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SqlLogSetName() {
        bsSqlLogSetName := BSTR.Owned()
        result := ComCall(78, this, BSTR.Ptr, bsSqlLogSetName, "HRESULT")
        return bsSqlLogSetName
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
        if (_ISystemMonitorUnion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Appearance := CallbackCreate(GetMethod(implObj, "get_Appearance"), flags, 2)
        this.vtbl.put_Appearance := CallbackCreate(GetMethod(implObj, "put_Appearance"), flags, 2)
        this.vtbl.get_BackColor := CallbackCreate(GetMethod(implObj, "get_BackColor"), flags, 2)
        this.vtbl.put_BackColor := CallbackCreate(GetMethod(implObj, "put_BackColor"), flags, 2)
        this.vtbl.get_BorderStyle := CallbackCreate(GetMethod(implObj, "get_BorderStyle"), flags, 2)
        this.vtbl.put_BorderStyle := CallbackCreate(GetMethod(implObj, "put_BorderStyle"), flags, 2)
        this.vtbl.get_ForeColor := CallbackCreate(GetMethod(implObj, "get_ForeColor"), flags, 2)
        this.vtbl.put_ForeColor := CallbackCreate(GetMethod(implObj, "put_ForeColor"), flags, 2)
        this.vtbl.get_Font := CallbackCreate(GetMethod(implObj, "get_Font"), flags, 2)
        this.vtbl.putref_Font := CallbackCreate(GetMethod(implObj, "putref_Font"), flags, 2)
        this.vtbl.get_Counters := CallbackCreate(GetMethod(implObj, "get_Counters"), flags, 2)
        this.vtbl.put_ShowVerticalGrid := CallbackCreate(GetMethod(implObj, "put_ShowVerticalGrid"), flags, 2)
        this.vtbl.get_ShowVerticalGrid := CallbackCreate(GetMethod(implObj, "get_ShowVerticalGrid"), flags, 2)
        this.vtbl.put_ShowHorizontalGrid := CallbackCreate(GetMethod(implObj, "put_ShowHorizontalGrid"), flags, 2)
        this.vtbl.get_ShowHorizontalGrid := CallbackCreate(GetMethod(implObj, "get_ShowHorizontalGrid"), flags, 2)
        this.vtbl.put_ShowLegend := CallbackCreate(GetMethod(implObj, "put_ShowLegend"), flags, 2)
        this.vtbl.get_ShowLegend := CallbackCreate(GetMethod(implObj, "get_ShowLegend"), flags, 2)
        this.vtbl.put_ShowScaleLabels := CallbackCreate(GetMethod(implObj, "put_ShowScaleLabels"), flags, 2)
        this.vtbl.get_ShowScaleLabels := CallbackCreate(GetMethod(implObj, "get_ShowScaleLabels"), flags, 2)
        this.vtbl.put_ShowValueBar := CallbackCreate(GetMethod(implObj, "put_ShowValueBar"), flags, 2)
        this.vtbl.get_ShowValueBar := CallbackCreate(GetMethod(implObj, "get_ShowValueBar"), flags, 2)
        this.vtbl.put_MaximumScale := CallbackCreate(GetMethod(implObj, "put_MaximumScale"), flags, 2)
        this.vtbl.get_MaximumScale := CallbackCreate(GetMethod(implObj, "get_MaximumScale"), flags, 2)
        this.vtbl.put_MinimumScale := CallbackCreate(GetMethod(implObj, "put_MinimumScale"), flags, 2)
        this.vtbl.get_MinimumScale := CallbackCreate(GetMethod(implObj, "get_MinimumScale"), flags, 2)
        this.vtbl.put_UpdateInterval := CallbackCreate(GetMethod(implObj, "put_UpdateInterval"), flags, 2)
        this.vtbl.get_UpdateInterval := CallbackCreate(GetMethod(implObj, "get_UpdateInterval"), flags, 2)
        this.vtbl.put_DisplayType := CallbackCreate(GetMethod(implObj, "put_DisplayType"), flags, 2)
        this.vtbl.get_DisplayType := CallbackCreate(GetMethod(implObj, "get_DisplayType"), flags, 2)
        this.vtbl.put_ManualUpdate := CallbackCreate(GetMethod(implObj, "put_ManualUpdate"), flags, 2)
        this.vtbl.get_ManualUpdate := CallbackCreate(GetMethod(implObj, "get_ManualUpdate"), flags, 2)
        this.vtbl.put_GraphTitle := CallbackCreate(GetMethod(implObj, "put_GraphTitle"), flags, 2)
        this.vtbl.get_GraphTitle := CallbackCreate(GetMethod(implObj, "get_GraphTitle"), flags, 2)
        this.vtbl.put_YAxisLabel := CallbackCreate(GetMethod(implObj, "put_YAxisLabel"), flags, 2)
        this.vtbl.get_YAxisLabel := CallbackCreate(GetMethod(implObj, "get_YAxisLabel"), flags, 2)
        this.vtbl.CollectSample := CallbackCreate(GetMethod(implObj, "CollectSample"), flags, 1)
        this.vtbl.UpdateGraph := CallbackCreate(GetMethod(implObj, "UpdateGraph"), flags, 1)
        this.vtbl.BrowseCounters := CallbackCreate(GetMethod(implObj, "BrowseCounters"), flags, 1)
        this.vtbl.DisplayProperties := CallbackCreate(GetMethod(implObj, "DisplayProperties"), flags, 1)
        this.vtbl.Counter := CallbackCreate(GetMethod(implObj, "Counter"), flags, 3)
        this.vtbl.AddCounter := CallbackCreate(GetMethod(implObj, "AddCounter"), flags, 3)
        this.vtbl.DeleteCounter := CallbackCreate(GetMethod(implObj, "DeleteCounter"), flags, 2)
        this.vtbl.get_BackColorCtl := CallbackCreate(GetMethod(implObj, "get_BackColorCtl"), flags, 2)
        this.vtbl.put_BackColorCtl := CallbackCreate(GetMethod(implObj, "put_BackColorCtl"), flags, 2)
        this.vtbl.put_LogFileName := CallbackCreate(GetMethod(implObj, "put_LogFileName"), flags, 2)
        this.vtbl.get_LogFileName := CallbackCreate(GetMethod(implObj, "get_LogFileName"), flags, 2)
        this.vtbl.put_LogViewStart := CallbackCreate(GetMethod(implObj, "put_LogViewStart"), flags, 2)
        this.vtbl.get_LogViewStart := CallbackCreate(GetMethod(implObj, "get_LogViewStart"), flags, 2)
        this.vtbl.put_LogViewStop := CallbackCreate(GetMethod(implObj, "put_LogViewStop"), flags, 2)
        this.vtbl.get_LogViewStop := CallbackCreate(GetMethod(implObj, "get_LogViewStop"), flags, 2)
        this.vtbl.get_GridColor := CallbackCreate(GetMethod(implObj, "get_GridColor"), flags, 2)
        this.vtbl.put_GridColor := CallbackCreate(GetMethod(implObj, "put_GridColor"), flags, 2)
        this.vtbl.get_TimeBarColor := CallbackCreate(GetMethod(implObj, "get_TimeBarColor"), flags, 2)
        this.vtbl.put_TimeBarColor := CallbackCreate(GetMethod(implObj, "put_TimeBarColor"), flags, 2)
        this.vtbl.get_Highlight := CallbackCreate(GetMethod(implObj, "get_Highlight"), flags, 2)
        this.vtbl.put_Highlight := CallbackCreate(GetMethod(implObj, "put_Highlight"), flags, 2)
        this.vtbl.get_ShowToolbar := CallbackCreate(GetMethod(implObj, "get_ShowToolbar"), flags, 2)
        this.vtbl.put_ShowToolbar := CallbackCreate(GetMethod(implObj, "put_ShowToolbar"), flags, 2)
        this.vtbl.Paste := CallbackCreate(GetMethod(implObj, "Paste"), flags, 1)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 1)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.put_ReadOnly := CallbackCreate(GetMethod(implObj, "put_ReadOnly"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.put_ReportValueType := CallbackCreate(GetMethod(implObj, "put_ReportValueType"), flags, 2)
        this.vtbl.get_ReportValueType := CallbackCreate(GetMethod(implObj, "get_ReportValueType"), flags, 2)
        this.vtbl.put_MonitorDuplicateInstances := CallbackCreate(GetMethod(implObj, "put_MonitorDuplicateInstances"), flags, 2)
        this.vtbl.get_MonitorDuplicateInstances := CallbackCreate(GetMethod(implObj, "get_MonitorDuplicateInstances"), flags, 2)
        this.vtbl.put_DisplayFilter := CallbackCreate(GetMethod(implObj, "put_DisplayFilter"), flags, 2)
        this.vtbl.get_DisplayFilter := CallbackCreate(GetMethod(implObj, "get_DisplayFilter"), flags, 2)
        this.vtbl.get_LogFiles := CallbackCreate(GetMethod(implObj, "get_LogFiles"), flags, 2)
        this.vtbl.put_DataSourceType := CallbackCreate(GetMethod(implObj, "put_DataSourceType"), flags, 2)
        this.vtbl.get_DataSourceType := CallbackCreate(GetMethod(implObj, "get_DataSourceType"), flags, 2)
        this.vtbl.put_SqlDsnName := CallbackCreate(GetMethod(implObj, "put_SqlDsnName"), flags, 2)
        this.vtbl.get_SqlDsnName := CallbackCreate(GetMethod(implObj, "get_SqlDsnName"), flags, 2)
        this.vtbl.put_SqlLogSetName := CallbackCreate(GetMethod(implObj, "put_SqlLogSetName"), flags, 2)
        this.vtbl.get_SqlLogSetName := CallbackCreate(GetMethod(implObj, "get_SqlLogSetName"), flags, 2)
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
        CallbackFree(this.vtbl.get_Appearance)
        CallbackFree(this.vtbl.put_Appearance)
        CallbackFree(this.vtbl.get_BackColor)
        CallbackFree(this.vtbl.put_BackColor)
        CallbackFree(this.vtbl.get_BorderStyle)
        CallbackFree(this.vtbl.put_BorderStyle)
        CallbackFree(this.vtbl.get_ForeColor)
        CallbackFree(this.vtbl.put_ForeColor)
        CallbackFree(this.vtbl.get_Font)
        CallbackFree(this.vtbl.putref_Font)
        CallbackFree(this.vtbl.get_Counters)
        CallbackFree(this.vtbl.put_ShowVerticalGrid)
        CallbackFree(this.vtbl.get_ShowVerticalGrid)
        CallbackFree(this.vtbl.put_ShowHorizontalGrid)
        CallbackFree(this.vtbl.get_ShowHorizontalGrid)
        CallbackFree(this.vtbl.put_ShowLegend)
        CallbackFree(this.vtbl.get_ShowLegend)
        CallbackFree(this.vtbl.put_ShowScaleLabels)
        CallbackFree(this.vtbl.get_ShowScaleLabels)
        CallbackFree(this.vtbl.put_ShowValueBar)
        CallbackFree(this.vtbl.get_ShowValueBar)
        CallbackFree(this.vtbl.put_MaximumScale)
        CallbackFree(this.vtbl.get_MaximumScale)
        CallbackFree(this.vtbl.put_MinimumScale)
        CallbackFree(this.vtbl.get_MinimumScale)
        CallbackFree(this.vtbl.put_UpdateInterval)
        CallbackFree(this.vtbl.get_UpdateInterval)
        CallbackFree(this.vtbl.put_DisplayType)
        CallbackFree(this.vtbl.get_DisplayType)
        CallbackFree(this.vtbl.put_ManualUpdate)
        CallbackFree(this.vtbl.get_ManualUpdate)
        CallbackFree(this.vtbl.put_GraphTitle)
        CallbackFree(this.vtbl.get_GraphTitle)
        CallbackFree(this.vtbl.put_YAxisLabel)
        CallbackFree(this.vtbl.get_YAxisLabel)
        CallbackFree(this.vtbl.CollectSample)
        CallbackFree(this.vtbl.UpdateGraph)
        CallbackFree(this.vtbl.BrowseCounters)
        CallbackFree(this.vtbl.DisplayProperties)
        CallbackFree(this.vtbl.Counter)
        CallbackFree(this.vtbl.AddCounter)
        CallbackFree(this.vtbl.DeleteCounter)
        CallbackFree(this.vtbl.get_BackColorCtl)
        CallbackFree(this.vtbl.put_BackColorCtl)
        CallbackFree(this.vtbl.put_LogFileName)
        CallbackFree(this.vtbl.get_LogFileName)
        CallbackFree(this.vtbl.put_LogViewStart)
        CallbackFree(this.vtbl.get_LogViewStart)
        CallbackFree(this.vtbl.put_LogViewStop)
        CallbackFree(this.vtbl.get_LogViewStop)
        CallbackFree(this.vtbl.get_GridColor)
        CallbackFree(this.vtbl.put_GridColor)
        CallbackFree(this.vtbl.get_TimeBarColor)
        CallbackFree(this.vtbl.put_TimeBarColor)
        CallbackFree(this.vtbl.get_Highlight)
        CallbackFree(this.vtbl.put_Highlight)
        CallbackFree(this.vtbl.get_ShowToolbar)
        CallbackFree(this.vtbl.put_ShowToolbar)
        CallbackFree(this.vtbl.Paste)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.put_ReadOnly)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.put_ReportValueType)
        CallbackFree(this.vtbl.get_ReportValueType)
        CallbackFree(this.vtbl.put_MonitorDuplicateInstances)
        CallbackFree(this.vtbl.get_MonitorDuplicateInstances)
        CallbackFree(this.vtbl.put_DisplayFilter)
        CallbackFree(this.vtbl.get_DisplayFilter)
        CallbackFree(this.vtbl.get_LogFiles)
        CallbackFree(this.vtbl.put_DataSourceType)
        CallbackFree(this.vtbl.get_DataSourceType)
        CallbackFree(this.vtbl.put_SqlDsnName)
        CallbackFree(this.vtbl.get_SqlDsnName)
        CallbackFree(this.vtbl.put_SqlLogSetName)
        CallbackFree(this.vtbl.get_SqlLogSetName)
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
