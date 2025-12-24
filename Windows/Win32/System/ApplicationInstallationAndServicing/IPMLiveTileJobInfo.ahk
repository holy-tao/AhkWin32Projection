#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMLiveTileJobInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMLiveTileJobInfo
     * @type {Guid}
     */
    static IID => Guid("{6009a81f-4710-4697-b5f6-2208f6057b8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_TileID", "get_NextSchedule", "set_NextSchedule", "get_StartSchedule", "set_StartSchedule", "get_IntervalDuration", "set_IntervalDuration", "get_RunForever", "set_RunForever", "get_MaxRunCount", "set_MaxRunCount", "get_RunCount", "set_RunCount", "get_RecurrenceType", "set_RecurrenceType", "get_TileXML", "set_TileXML", "get_UrlXML", "set_UrlXML", "get_AttemptCount", "set_AttemptCount", "get_DownloadState", "set_DownloadState"]

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     */
    TileID {
        get => this.get_TileID()
    }

    /**
     * @type {FILETIME} 
     */
    NextSchedule {
        get => this.get_NextSchedule()
    }

    /**
     * @type {FILETIME} 
     */
    StartSchedule {
        get => this.get_StartSchedule()
    }

    /**
     * @type {Integer} 
     */
    IntervalDuration {
        get => this.get_IntervalDuration()
    }

    /**
     * @type {BOOL} 
     */
    RunForever {
        get => this.get_RunForever()
    }

    /**
     * @type {Integer} 
     */
    MaxRunCount {
        get => this.get_MaxRunCount()
    }

    /**
     * @type {Integer} 
     */
    RunCount {
        get => this.get_RunCount()
    }

    /**
     * @type {Integer} 
     */
    RecurrenceType {
        get => this.get_RecurrenceType()
    }

    /**
     * @type {Integer} 
     */
    AttemptCount {
        get => this.get_AttemptCount()
    }

    /**
     * @type {Integer} 
     */
    DownloadState {
        get => this.get_DownloadState()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, "ptr", pTileID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_NextSchedule() {
        pNextSchedule := FILETIME()
        result := ComCall(5, this, "ptr", pNextSchedule, "HRESULT")
        return pNextSchedule
    }

    /**
     * 
     * @param {FILETIME} ftNextSchedule 
     * @returns {HRESULT} 
     */
    set_NextSchedule(ftNextSchedule) {
        result := ComCall(6, this, "ptr", ftNextSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_StartSchedule() {
        pStartSchedule := FILETIME()
        result := ComCall(7, this, "ptr", pStartSchedule, "HRESULT")
        return pStartSchedule
    }

    /**
     * 
     * @param {FILETIME} ftStartSchedule 
     * @returns {HRESULT} 
     */
    set_StartSchedule(ftStartSchedule) {
        result := ComCall(8, this, "ptr", ftStartSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IntervalDuration() {
        result := ComCall(9, this, "uint*", &pIntervalDuration := 0, "HRESULT")
        return pIntervalDuration
    }

    /**
     * 
     * @param {Integer} ulIntervalDuration 
     * @returns {HRESULT} 
     */
    set_IntervalDuration(ulIntervalDuration) {
        result := ComCall(10, this, "uint", ulIntervalDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_RunForever() {
        result := ComCall(11, this, "int*", &IsRunForever := 0, "HRESULT")
        return IsRunForever
    }

    /**
     * 
     * @param {BOOL} fRunForever 
     * @returns {HRESULT} 
     */
    set_RunForever(fRunForever) {
        result := ComCall(12, this, "int", fRunForever, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxRunCount() {
        result := ComCall(13, this, "uint*", &pMaxRunCount := 0, "HRESULT")
        return pMaxRunCount
    }

    /**
     * 
     * @param {Integer} ulMaxRunCount 
     * @returns {HRESULT} 
     */
    set_MaxRunCount(ulMaxRunCount) {
        result := ComCall(14, this, "uint", ulMaxRunCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RunCount() {
        result := ComCall(15, this, "uint*", &pRunCount := 0, "HRESULT")
        return pRunCount
    }

    /**
     * 
     * @param {Integer} ulRunCount 
     * @returns {HRESULT} 
     */
    set_RunCount(ulRunCount) {
        result := ComCall(16, this, "uint", ulRunCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RecurrenceType() {
        result := ComCall(17, this, "uint*", &pRecurrenceType := 0, "HRESULT")
        return pRecurrenceType
    }

    /**
     * 
     * @param {Integer} ulRecurrenceType 
     * @returns {HRESULT} 
     */
    set_RecurrenceType(ulRecurrenceType) {
        result := ComCall(18, this, "uint", ulRecurrenceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pTileXml 
     * @param {Pointer<Integer>} pcbTileXml 
     * @returns {HRESULT} 
     */
    get_TileXML(pTileXml, pcbTileXml) {
        pTileXmlMarshal := pTileXml is VarRef ? "ptr*" : "ptr"
        pcbTileXmlMarshal := pcbTileXml is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pTileXmlMarshal, pTileXml, pcbTileXmlMarshal, pcbTileXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTileXml 
     * @param {Integer} cbTileXml 
     * @returns {HRESULT} 
     */
    set_TileXML(pTileXml, cbTileXml) {
        pTileXmlMarshal := pTileXml is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, pTileXmlMarshal, pTileXml, "uint", cbTileXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pUrlXML 
     * @param {Pointer<Integer>} pcbUrlXML 
     * @returns {HRESULT} 
     */
    get_UrlXML(pUrlXML, pcbUrlXML) {
        pUrlXMLMarshal := pUrlXML is VarRef ? "ptr*" : "ptr"
        pcbUrlXMLMarshal := pcbUrlXML is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pUrlXMLMarshal, pUrlXML, pcbUrlXMLMarshal, pcbUrlXML, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pUrlXML 
     * @param {Integer} cbUrlXML 
     * @returns {HRESULT} 
     */
    set_UrlXML(pUrlXML, cbUrlXML) {
        pUrlXMLMarshal := pUrlXML is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, pUrlXMLMarshal, pUrlXML, "uint", cbUrlXML, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttemptCount() {
        result := ComCall(23, this, "uint*", &pAttemptCount := 0, "HRESULT")
        return pAttemptCount
    }

    /**
     * 
     * @param {Integer} ulAttemptCount 
     * @returns {HRESULT} 
     */
    set_AttemptCount(ulAttemptCount) {
        result := ComCall(24, this, "uint", ulAttemptCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadState() {
        result := ComCall(25, this, "uint*", &pDownloadState := 0, "HRESULT")
        return pDownloadState
    }

    /**
     * 
     * @param {Integer} ulDownloadState 
     * @returns {HRESULT} 
     */
    set_DownloadState(ulDownloadState) {
        result := ComCall(26, this, "uint", ulDownloadState, "HRESULT")
        return result
    }
}
