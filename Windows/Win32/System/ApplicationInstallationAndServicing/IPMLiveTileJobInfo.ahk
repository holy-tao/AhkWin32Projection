#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return result
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
     * @param {Pointer<FILETIME>} pNextSchedule 
     * @returns {HRESULT} 
     */
    get_NextSchedule(pNextSchedule) {
        result := ComCall(5, this, "ptr", pNextSchedule, "HRESULT")
        return result
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
     * @param {Pointer<FILETIME>} pStartSchedule 
     * @returns {HRESULT} 
     */
    get_StartSchedule(pStartSchedule) {
        result := ComCall(7, this, "ptr", pStartSchedule, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pIntervalDuration 
     * @returns {HRESULT} 
     */
    get_IntervalDuration(pIntervalDuration) {
        result := ComCall(9, this, "uint*", pIntervalDuration, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} IsRunForever 
     * @returns {HRESULT} 
     */
    get_RunForever(IsRunForever) {
        result := ComCall(11, this, "ptr", IsRunForever, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pMaxRunCount 
     * @returns {HRESULT} 
     */
    get_MaxRunCount(pMaxRunCount) {
        result := ComCall(13, this, "uint*", pMaxRunCount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pRunCount 
     * @returns {HRESULT} 
     */
    get_RunCount(pRunCount) {
        result := ComCall(15, this, "uint*", pRunCount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pRecurrenceType 
     * @returns {HRESULT} 
     */
    get_RecurrenceType(pRecurrenceType) {
        result := ComCall(17, this, "uint*", pRecurrenceType, "HRESULT")
        return result
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
        result := ComCall(19, this, "ptr*", pTileXml, "uint*", pcbTileXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTileXml 
     * @param {Integer} cbTileXml 
     * @returns {HRESULT} 
     */
    set_TileXML(pTileXml, cbTileXml) {
        result := ComCall(20, this, "char*", pTileXml, "uint", cbTileXml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pUrlXML 
     * @param {Pointer<Integer>} pcbUrlXML 
     * @returns {HRESULT} 
     */
    get_UrlXML(pUrlXML, pcbUrlXML) {
        result := ComCall(21, this, "ptr*", pUrlXML, "uint*", pcbUrlXML, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pUrlXML 
     * @param {Integer} cbUrlXML 
     * @returns {HRESULT} 
     */
    set_UrlXML(pUrlXML, cbUrlXML) {
        result := ComCall(22, this, "char*", pUrlXML, "uint", cbUrlXML, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAttemptCount 
     * @returns {HRESULT} 
     */
    get_AttemptCount(pAttemptCount) {
        result := ComCall(23, this, "uint*", pAttemptCount, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pDownloadState 
     * @returns {HRESULT} 
     */
    get_DownloadState(pDownloadState) {
        result := ComCall(25, this, "uint*", pDownloadState, "HRESULT")
        return result
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
