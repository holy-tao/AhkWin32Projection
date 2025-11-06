#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Ole\IFontDisp.ahk
#Include .\ICounters.ahk
#Include .\ICounterItem.ahk
#Include .\ILogFiles.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ISystemMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemMonitor
     * @type {Guid}
     */
    static IID => Guid("{194eb241-c32c-11cf-9398-00aa00a3ddea}")

    /**
     * The class identifier for SystemMonitor
     * @type {Guid}
     */
    static CLSID => Guid("{c4d2d8e0-d1dd-11ce-940f-008029004347}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Appearance", "put_Appearance", "get_BackColor", "put_BackColor", "get_BorderStyle", "put_BorderStyle", "get_ForeColor", "put_ForeColor", "get_Font", "putref_Font", "get_Counters", "put_ShowVerticalGrid", "get_ShowVerticalGrid", "put_ShowHorizontalGrid", "get_ShowHorizontalGrid", "put_ShowLegend", "get_ShowLegend", "put_ShowScaleLabels", "get_ShowScaleLabels", "put_ShowValueBar", "get_ShowValueBar", "put_MaximumScale", "get_MaximumScale", "put_MinimumScale", "get_MinimumScale", "put_UpdateInterval", "get_UpdateInterval", "put_DisplayType", "get_DisplayType", "put_ManualUpdate", "get_ManualUpdate", "put_GraphTitle", "get_GraphTitle", "put_YAxisLabel", "get_YAxisLabel", "CollectSample", "UpdateGraph", "BrowseCounters", "DisplayProperties", "Counter", "AddCounter", "DeleteCounter", "get_BackColorCtl", "put_BackColorCtl", "put_LogFileName", "get_LogFileName", "put_LogViewStart", "get_LogViewStart", "put_LogViewStop", "get_LogViewStop", "get_GridColor", "put_GridColor", "get_TimeBarColor", "put_TimeBarColor", "get_Highlight", "put_Highlight", "get_ShowToolbar", "put_ShowToolbar", "Paste", "Copy", "Reset", "put_ReadOnly", "get_ReadOnly", "put_ReportValueType", "get_ReportValueType", "put_MonitorDuplicateInstances", "get_MonitorDuplicateInstances", "put_DisplayFilter", "get_DisplayFilter", "get_LogFiles", "put_DataSourceType", "get_DataSourceType", "put_SqlDsnName", "get_SqlDsnName", "put_SqlLogSetName", "get_SqlLogSetName"]

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
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_BackColor(Color) {
        result := ComCall(6, this, "uint", Color, "HRESULT")
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
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_ForeColor(Color) {
        result := ComCall(10, this, "uint", Color, "HRESULT")
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
        result := ComCall(14, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ShowVerticalGrid() {
        result := ComCall(15, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ShowHorizontalGrid() {
        result := ComCall(17, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ShowLegend() {
        result := ComCall(19, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ShowScaleLabels() {
        result := ComCall(21, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ShowValueBar() {
        result := ComCall(23, this, "short*", &pbState := 0, "HRESULT")
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
     * @param {Integer} eDisplayType 
     * @returns {HRESULT} 
     */
    put_DisplayType(eDisplayType) {
        result := ComCall(30, this, "int", eDisplayType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(32, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_ManualUpdate() {
        result := ComCall(33, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {BSTR} 
     */
    get_GraphTitle() {
        pbsTitle := BSTR()
        result := ComCall(35, this, "ptr", pbsTitle, "HRESULT")
        return pbsTitle
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
     * @returns {BSTR} 
     */
    get_YAxisLabel() {
        pbsTitle := BSTR()
        result := ComCall(37, this, "ptr", pbsTitle, "HRESULT")
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

        result := ComCall(43, this, "ptr", bsPath, "ptr*", &ppICounter := 0, "HRESULT")
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
     * @returns {BSTR} 
     */
    get_LogFileName() {
        bsFileName := BSTR()
        result := ComCall(48, this, "ptr", bsFileName, "HRESULT")
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
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_GridColor(Color) {
        result := ComCall(54, this, "uint", Color, "HRESULT")
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
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_TimeBarColor(Color) {
        result := ComCall(56, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Highlight() {
        result := ComCall(57, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ShowToolbar() {
        result := ComCall(59, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {VARIANT_BOOL} 
     */
    get_ReadOnly() {
        result := ComCall(65, this, "short*", &pbState := 0, "HRESULT")
        return pbState
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
     * @returns {Integer} 
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
        result := ComCall(68, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_MonitorDuplicateInstances() {
        result := ComCall(69, this, "short*", &pbState := 0, "HRESULT")
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
     * @param {Integer} eDataSourceType 
     * @returns {HRESULT} 
     */
    put_DataSourceType(eDataSourceType) {
        result := ComCall(73, this, "int", eDataSourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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

        result := ComCall(75, this, "ptr", bsSqlDsnName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SqlDsnName() {
        bsSqlDsnName := BSTR()
        result := ComCall(76, this, "ptr", bsSqlDsnName, "HRESULT")
        return bsSqlDsnName
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
     * @returns {BSTR} 
     */
    get_SqlLogSetName() {
        bsSqlLogSetName := BSTR()
        result := ComCall(78, this, "ptr", bsSqlLogSetName, "HRESULT")
        return bsSqlLogSetName
    }
}
