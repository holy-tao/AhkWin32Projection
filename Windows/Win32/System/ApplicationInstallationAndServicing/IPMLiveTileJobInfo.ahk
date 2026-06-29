#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMLiveTileJobInfo extends IUnknown {
    /**
     * The interface identifier for IPMLiveTileJobInfo
     * @type {Guid}
     */
    static IID := Guid("{6009a81f-4710-4697-b5f6-2208f6057b8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMLiveTileJobInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID        : IntPtr
        get_TileID           : IntPtr
        get_NextSchedule     : IntPtr
        set_NextSchedule     : IntPtr
        get_StartSchedule    : IntPtr
        set_StartSchedule    : IntPtr
        get_IntervalDuration : IntPtr
        set_IntervalDuration : IntPtr
        get_RunForever       : IntPtr
        set_RunForever       : IntPtr
        get_MaxRunCount      : IntPtr
        set_MaxRunCount      : IntPtr
        get_RunCount         : IntPtr
        set_RunCount         : IntPtr
        get_RecurrenceType   : IntPtr
        set_RecurrenceType   : IntPtr
        get_TileXML          : IntPtr
        set_TileXML          : IntPtr
        get_UrlXML           : IntPtr
        set_UrlXML           : IntPtr
        get_AttemptCount     : IntPtr
        set_AttemptCount     : IntPtr
        get_DownloadState    : IntPtr
        set_DownloadState    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMLiveTileJobInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, BSTR.Ptr, pTileID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_NextSchedule() {
        pNextSchedule := FILETIME()
        result := ComCall(5, this, FILETIME.Ptr, pNextSchedule, "HRESULT")
        return pNextSchedule
    }

    /**
     * 
     * @param {FILETIME} ftNextSchedule 
     * @returns {HRESULT} 
     */
    set_NextSchedule(ftNextSchedule) {
        result := ComCall(6, this, FILETIME, ftNextSchedule, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_StartSchedule() {
        pStartSchedule := FILETIME()
        result := ComCall(7, this, FILETIME.Ptr, pStartSchedule, "HRESULT")
        return pStartSchedule
    }

    /**
     * 
     * @param {FILETIME} ftStartSchedule 
     * @returns {HRESULT} 
     */
    set_StartSchedule(ftStartSchedule) {
        result := ComCall(8, this, FILETIME, ftStartSchedule, "HRESULT")
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
        result := ComCall(11, this, BOOL.Ptr, &IsRunForever := 0, "HRESULT")
        return IsRunForever
    }

    /**
     * 
     * @param {BOOL} fRunForever 
     * @returns {HRESULT} 
     */
    set_RunForever(fRunForever) {
        result := ComCall(12, this, BOOL, fRunForever, "HRESULT")
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

    Query(iid) {
        if (IPMLiveTileJobInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_TileID := CallbackCreate(GetMethod(implObj, "get_TileID"), flags, 2)
        this.vtbl.get_NextSchedule := CallbackCreate(GetMethod(implObj, "get_NextSchedule"), flags, 2)
        this.vtbl.set_NextSchedule := CallbackCreate(GetMethod(implObj, "set_NextSchedule"), flags, 2)
        this.vtbl.get_StartSchedule := CallbackCreate(GetMethod(implObj, "get_StartSchedule"), flags, 2)
        this.vtbl.set_StartSchedule := CallbackCreate(GetMethod(implObj, "set_StartSchedule"), flags, 2)
        this.vtbl.get_IntervalDuration := CallbackCreate(GetMethod(implObj, "get_IntervalDuration"), flags, 2)
        this.vtbl.set_IntervalDuration := CallbackCreate(GetMethod(implObj, "set_IntervalDuration"), flags, 2)
        this.vtbl.get_RunForever := CallbackCreate(GetMethod(implObj, "get_RunForever"), flags, 2)
        this.vtbl.set_RunForever := CallbackCreate(GetMethod(implObj, "set_RunForever"), flags, 2)
        this.vtbl.get_MaxRunCount := CallbackCreate(GetMethod(implObj, "get_MaxRunCount"), flags, 2)
        this.vtbl.set_MaxRunCount := CallbackCreate(GetMethod(implObj, "set_MaxRunCount"), flags, 2)
        this.vtbl.get_RunCount := CallbackCreate(GetMethod(implObj, "get_RunCount"), flags, 2)
        this.vtbl.set_RunCount := CallbackCreate(GetMethod(implObj, "set_RunCount"), flags, 2)
        this.vtbl.get_RecurrenceType := CallbackCreate(GetMethod(implObj, "get_RecurrenceType"), flags, 2)
        this.vtbl.set_RecurrenceType := CallbackCreate(GetMethod(implObj, "set_RecurrenceType"), flags, 2)
        this.vtbl.get_TileXML := CallbackCreate(GetMethod(implObj, "get_TileXML"), flags, 3)
        this.vtbl.set_TileXML := CallbackCreate(GetMethod(implObj, "set_TileXML"), flags, 3)
        this.vtbl.get_UrlXML := CallbackCreate(GetMethod(implObj, "get_UrlXML"), flags, 3)
        this.vtbl.set_UrlXML := CallbackCreate(GetMethod(implObj, "set_UrlXML"), flags, 3)
        this.vtbl.get_AttemptCount := CallbackCreate(GetMethod(implObj, "get_AttemptCount"), flags, 2)
        this.vtbl.set_AttemptCount := CallbackCreate(GetMethod(implObj, "set_AttemptCount"), flags, 2)
        this.vtbl.get_DownloadState := CallbackCreate(GetMethod(implObj, "get_DownloadState"), flags, 2)
        this.vtbl.set_DownloadState := CallbackCreate(GetMethod(implObj, "set_DownloadState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_TileID)
        CallbackFree(this.vtbl.get_NextSchedule)
        CallbackFree(this.vtbl.set_NextSchedule)
        CallbackFree(this.vtbl.get_StartSchedule)
        CallbackFree(this.vtbl.set_StartSchedule)
        CallbackFree(this.vtbl.get_IntervalDuration)
        CallbackFree(this.vtbl.set_IntervalDuration)
        CallbackFree(this.vtbl.get_RunForever)
        CallbackFree(this.vtbl.set_RunForever)
        CallbackFree(this.vtbl.get_MaxRunCount)
        CallbackFree(this.vtbl.set_MaxRunCount)
        CallbackFree(this.vtbl.get_RunCount)
        CallbackFree(this.vtbl.set_RunCount)
        CallbackFree(this.vtbl.get_RecurrenceType)
        CallbackFree(this.vtbl.set_RecurrenceType)
        CallbackFree(this.vtbl.get_TileXML)
        CallbackFree(this.vtbl.set_TileXML)
        CallbackFree(this.vtbl.get_UrlXML)
        CallbackFree(this.vtbl.set_UrlXML)
        CallbackFree(this.vtbl.get_AttemptCount)
        CallbackFree(this.vtbl.set_AttemptCount)
        CallbackFree(this.vtbl.get_DownloadState)
        CallbackFree(this.vtbl.set_DownloadState)
    }
}
