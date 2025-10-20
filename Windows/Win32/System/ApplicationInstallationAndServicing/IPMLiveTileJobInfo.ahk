#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMLiveTileJobInfo extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTileID 
     * @returns {HRESULT} 
     */
    get_TileID(pTileID) {
        result := ComCall(4, this, "ptr", pTileID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pNextSchedule 
     * @returns {HRESULT} 
     */
    get_NextSchedule(pNextSchedule) {
        result := ComCall(5, this, "ptr", pNextSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {FILETIME} ftNextSchedule 
     * @returns {HRESULT} 
     */
    set_NextSchedule(ftNextSchedule) {
        result := ComCall(6, this, "ptr", ftNextSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pStartSchedule 
     * @returns {HRESULT} 
     */
    get_StartSchedule(pStartSchedule) {
        result := ComCall(7, this, "ptr", pStartSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {FILETIME} ftStartSchedule 
     * @returns {HRESULT} 
     */
    set_StartSchedule(ftStartSchedule) {
        result := ComCall(8, this, "ptr", ftStartSchedule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pIntervalDuration 
     * @returns {HRESULT} 
     */
    get_IntervalDuration(pIntervalDuration) {
        result := ComCall(9, this, "uint*", pIntervalDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIntervalDuration 
     * @returns {HRESULT} 
     */
    set_IntervalDuration(ulIntervalDuration) {
        result := ComCall(10, this, "uint", ulIntervalDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsRunForever 
     * @returns {HRESULT} 
     */
    get_RunForever(IsRunForever) {
        result := ComCall(11, this, "ptr", IsRunForever, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRunForever 
     * @returns {HRESULT} 
     */
    set_RunForever(fRunForever) {
        result := ComCall(12, this, "int", fRunForever, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMaxRunCount 
     * @returns {HRESULT} 
     */
    get_MaxRunCount(pMaxRunCount) {
        result := ComCall(13, this, "uint*", pMaxRunCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMaxRunCount 
     * @returns {HRESULT} 
     */
    set_MaxRunCount(ulMaxRunCount) {
        result := ComCall(14, this, "uint", ulMaxRunCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pRunCount 
     * @returns {HRESULT} 
     */
    get_RunCount(pRunCount) {
        result := ComCall(15, this, "uint*", pRunCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRunCount 
     * @returns {HRESULT} 
     */
    set_RunCount(ulRunCount) {
        result := ComCall(16, this, "uint", ulRunCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pRecurrenceType 
     * @returns {HRESULT} 
     */
    get_RecurrenceType(pRecurrenceType) {
        result := ComCall(17, this, "uint*", pRecurrenceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRecurrenceType 
     * @returns {HRESULT} 
     */
    set_RecurrenceType(ulRecurrenceType) {
        result := ComCall(18, this, "uint", ulRecurrenceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pTileXml 
     * @param {Pointer<UInt32>} pcbTileXml 
     * @returns {HRESULT} 
     */
    get_TileXML(pTileXml, pcbTileXml) {
        result := ComCall(19, this, "char*", pTileXml, "uint*", pcbTileXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pTileXml 
     * @param {Integer} cbTileXml 
     * @returns {HRESULT} 
     */
    set_TileXML(pTileXml, cbTileXml) {
        result := ComCall(20, this, "char*", pTileXml, "uint", cbTileXml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pUrlXML 
     * @param {Pointer<UInt32>} pcbUrlXML 
     * @returns {HRESULT} 
     */
    get_UrlXML(pUrlXML, pcbUrlXML) {
        result := ComCall(21, this, "char*", pUrlXML, "uint*", pcbUrlXML, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pUrlXML 
     * @param {Integer} cbUrlXML 
     * @returns {HRESULT} 
     */
    set_UrlXML(pUrlXML, cbUrlXML) {
        result := ComCall(22, this, "char*", pUrlXML, "uint", cbUrlXML, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pAttemptCount 
     * @returns {HRESULT} 
     */
    get_AttemptCount(pAttemptCount) {
        result := ComCall(23, this, "uint*", pAttemptCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAttemptCount 
     * @returns {HRESULT} 
     */
    set_AttemptCount(ulAttemptCount) {
        result := ComCall(24, this, "uint", ulAttemptCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pDownloadState 
     * @returns {HRESULT} 
     */
    get_DownloadState(pDownloadState) {
        result := ComCall(25, this, "uint*", pDownloadState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulDownloadState 
     * @returns {HRESULT} 
     */
    set_DownloadState(ulDownloadState) {
        result := ComCall(26, this, "uint", ulDownloadState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
