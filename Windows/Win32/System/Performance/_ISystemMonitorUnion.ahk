#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class _ISystemMonitorUnion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ISystemMonitorUnion
     * @type {Guid}
     */
    static IID => Guid("{c8a77338-265f-4de5-aa25-c7da1ce5a8f4}")

    /**
     * The class identifier for _ISystemMonitorUnion
     * @type {Guid}
     */
    static CLSID => Guid("{c8a77338-265f-4de5-aa25-c7da1ce5a8f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Appearance", "put_Appearance", "get_BackColor", "put_BackColor", "get_BorderStyle", "put_BorderStyle", "get_ForeColor", "put_ForeColor", "get_Font", "putref_Font", "get_Counters", "put_ShowVerticalGrid", "get_ShowVerticalGrid", "put_ShowHorizontalGrid", "get_ShowHorizontalGrid", "put_ShowLegend", "get_ShowLegend", "put_ShowScaleLabels", "get_ShowScaleLabels", "put_ShowValueBar", "get_ShowValueBar", "put_MaximumScale", "get_MaximumScale", "put_MinimumScale", "get_MinimumScale", "put_UpdateInterval", "get_UpdateInterval", "put_DisplayType", "get_DisplayType", "put_ManualUpdate", "get_ManualUpdate", "put_GraphTitle", "get_GraphTitle", "put_YAxisLabel", "get_YAxisLabel", "CollectSample", "UpdateGraph", "BrowseCounters", "DisplayProperties", "Counter", "AddCounter", "DeleteCounter", "get_BackColorCtl", "put_BackColorCtl", "put_LogFileName", "get_LogFileName", "put_LogViewStart", "get_LogViewStart", "put_LogViewStop", "get_LogViewStop", "get_GridColor", "put_GridColor", "get_TimeBarColor", "put_TimeBarColor", "get_Highlight", "put_Highlight", "get_ShowToolbar", "put_ShowToolbar", "Paste", "Copy", "Reset", "put_ReadOnly", "get_ReadOnly", "put_ReportValueType", "get_ReportValueType", "put_MonitorDuplicateInstances", "get_MonitorDuplicateInstances", "put_DisplayFilter", "get_DisplayFilter", "get_LogFiles", "put_DataSourceType", "get_DataSourceType", "put_SqlDsnName", "get_SqlDsnName", "put_SqlLogSetName", "get_SqlLogSetName", "put_EnableDigitGrouping", "get_EnableDigitGrouping", "put_EnableToolTips", "get_EnableToolTips", "put_ShowTimeAxisLabels", "get_ShowTimeAxisLabels", "put_ChartScroll", "get_ChartScroll", "put_DataPointCount", "get_DataPointCount", "ScaleToFit", "SaveAs", "Relog", "ClearData", "get_LogSourceStartTime", "get_LogSourceStopTime", "SetLogViewRange", "GetLogViewRange", "BatchingLock", "LoadSettings"]

    /**
     * 
     * @param {Pointer<Integer>} iAppearance 
     * @returns {HRESULT} 
     */
    get_Appearance(iAppearance) {
        result := ComCall(3, this, "int*", iAppearance, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_BackColor(pColor) {
        result := ComCall(5, this, "uint*", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_BackColor(Color) {
        result := ComCall(6, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iBorderStyle 
     * @returns {HRESULT} 
     */
    get_BorderStyle(iBorderStyle) {
        result := ComCall(7, this, "int*", iBorderStyle, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_ForeColor(pColor) {
        result := ComCall(9, this, "uint*", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_ForeColor(Color) {
        result := ComCall(10, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IFontDisp>} ppFont 
     * @returns {HRESULT} 
     */
    get_Font(ppFont) {
        result := ComCall(11, this, "ptr*", ppFont, "HRESULT")
        return result
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
     * @param {Pointer<ICounters>} ppICounters 
     * @returns {HRESULT} 
     */
    get_Counters(ppICounters) {
        result := ComCall(13, this, "ptr*", ppICounters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowVerticalGrid(bState) {
        result := ComCall(14, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowVerticalGrid(pbState) {
        result := ComCall(15, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowHorizontalGrid(bState) {
        result := ComCall(16, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowHorizontalGrid(pbState) {
        result := ComCall(17, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowLegend(bState) {
        result := ComCall(18, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowLegend(pbState) {
        result := ComCall(19, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowScaleLabels(bState) {
        result := ComCall(20, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowScaleLabels(pbState) {
        result := ComCall(21, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowValueBar(bState) {
        result := ComCall(22, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowValueBar(pbState) {
        result := ComCall(23, this, "ptr", pbState, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_MaximumScale(piValue) {
        result := ComCall(25, this, "int*", piValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_MinimumScale(piValue) {
        result := ComCall(27, this, "int*", piValue, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pfValue 
     * @returns {HRESULT} 
     */
    get_UpdateInterval(pfValue) {
        result := ComCall(29, this, "float*", pfValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eDisplayType 
     * @returns {HRESULT} 
     */
    put_DisplayType(eDisplayType) {
        result := ComCall(30, this, "int", eDisplayType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peDisplayType 
     * @returns {HRESULT} 
     */
    get_DisplayType(peDisplayType) {
        result := ComCall(31, this, "int*", peDisplayType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ManualUpdate(bState) {
        result := ComCall(32, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ManualUpdate(pbState) {
        result := ComCall(33, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsTitle 
     * @returns {HRESULT} 
     */
    put_GraphTitle(bsTitle) {
        bsTitle := bsTitle is String ? BSTR.Alloc(bsTitle).Value : bsTitle

        result := ComCall(34, this, "ptr", bsTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbsTitle 
     * @returns {HRESULT} 
     */
    get_GraphTitle(pbsTitle) {
        result := ComCall(35, this, "ptr", pbsTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsTitle 
     * @returns {HRESULT} 
     */
    put_YAxisLabel(bsTitle) {
        bsTitle := bsTitle is String ? BSTR.Alloc(bsTitle).Value : bsTitle

        result := ComCall(36, this, "ptr", bsTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbsTitle 
     * @returns {HRESULT} 
     */
    get_YAxisLabel(pbsTitle) {
        result := ComCall(37, this, "ptr", pbsTitle, "HRESULT")
        return result
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
     * @param {Pointer<ICounterItem>} ppICounter 
     * @returns {HRESULT} 
     */
    Counter(iIndex, ppICounter) {
        result := ComCall(42, this, "int", iIndex, "ptr*", ppICounter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsPath 
     * @param {Pointer<ICounterItem>} ppICounter 
     * @returns {HRESULT} 
     */
    AddCounter(bsPath, ppICounter) {
        bsPath := bsPath is String ? BSTR.Alloc(bsPath).Value : bsPath

        result := ComCall(43, this, "ptr", bsPath, "ptr*", ppICounter, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_BackColorCtl(pColor) {
        result := ComCall(45, this, "uint*", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_BackColorCtl(Color) {
        result := ComCall(46, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsFileName 
     * @returns {HRESULT} 
     */
    put_LogFileName(bsFileName) {
        bsFileName := bsFileName is String ? BSTR.Alloc(bsFileName).Value : bsFileName

        result := ComCall(47, this, "ptr", bsFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bsFileName 
     * @returns {HRESULT} 
     */
    get_LogFileName(bsFileName) {
        result := ComCall(48, this, "ptr", bsFileName, "HRESULT")
        return result
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
     * @param {Pointer<Float>} StartTime 
     * @returns {HRESULT} 
     */
    get_LogViewStart(StartTime) {
        result := ComCall(50, this, "double*", StartTime, "HRESULT")
        return result
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
     * @param {Pointer<Float>} StopTime 
     * @returns {HRESULT} 
     */
    get_LogViewStop(StopTime) {
        result := ComCall(52, this, "double*", StopTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_GridColor(pColor) {
        result := ComCall(53, this, "uint*", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_GridColor(Color) {
        result := ComCall(54, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_TimeBarColor(pColor) {
        result := ComCall(55, this, "uint*", pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_TimeBarColor(Color) {
        result := ComCall(56, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_Highlight(pbState) {
        result := ComCall(57, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Highlight(bState) {
        result := ComCall(58, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ShowToolbar(pbState) {
        result := ComCall(59, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_ShowToolbar(bState) {
        result := ComCall(60, this, "short", bState, "HRESULT")
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
        result := ComCall(64, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_ReadOnly(pbState) {
        result := ComCall(65, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eReportValueType 
     * @returns {HRESULT} 
     */
    put_ReportValueType(eReportValueType) {
        result := ComCall(66, this, "int", eReportValueType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peReportValueType 
     * @returns {HRESULT} 
     */
    get_ReportValueType(peReportValueType) {
        result := ComCall(67, this, "int*", peReportValueType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_MonitorDuplicateInstances(bState) {
        result := ComCall(68, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_MonitorDuplicateInstances(pbState) {
        result := ComCall(69, this, "ptr", pbState, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_DisplayFilter(piValue) {
        result := ComCall(71, this, "int*", piValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ILogFiles>} ppILogFiles 
     * @returns {HRESULT} 
     */
    get_LogFiles(ppILogFiles) {
        result := ComCall(72, this, "ptr*", ppILogFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eDataSourceType 
     * @returns {HRESULT} 
     */
    put_DataSourceType(eDataSourceType) {
        result := ComCall(73, this, "int", eDataSourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peDataSourceType 
     * @returns {HRESULT} 
     */
    get_DataSourceType(peDataSourceType) {
        result := ComCall(74, this, "int*", peDataSourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsSqlDsnName 
     * @returns {HRESULT} 
     */
    put_SqlDsnName(bsSqlDsnName) {
        bsSqlDsnName := bsSqlDsnName is String ? BSTR.Alloc(bsSqlDsnName).Value : bsSqlDsnName

        result := ComCall(75, this, "ptr", bsSqlDsnName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bsSqlDsnName 
     * @returns {HRESULT} 
     */
    get_SqlDsnName(bsSqlDsnName) {
        result := ComCall(76, this, "ptr", bsSqlDsnName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bsSqlLogSetName 
     * @returns {HRESULT} 
     */
    put_SqlLogSetName(bsSqlLogSetName) {
        bsSqlLogSetName := bsSqlLogSetName is String ? BSTR.Alloc(bsSqlLogSetName).Value : bsSqlLogSetName

        result := ComCall(77, this, "ptr", bsSqlLogSetName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} bsSqlLogSetName 
     * @returns {HRESULT} 
     */
    get_SqlLogSetName(bsSqlLogSetName) {
        result := ComCall(78, this, "ptr", bsSqlLogSetName, "HRESULT")
        return result
    }

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
