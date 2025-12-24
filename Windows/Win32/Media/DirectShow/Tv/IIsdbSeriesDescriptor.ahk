#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbseriesdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbSeriesDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbSeriesDescriptor
     * @type {Guid}
     */
    static IID => Guid("{07ef6370-1660-4f26-87fc-614adab24b11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetSeriesId", "GetRepeatLabel", "GetProgramPattern", "GetExpireDate", "GetEpisodeNumber", "GetLastEpisodeNumber", "GetSeriesNameW"]

    /**
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the tag value. For ISDB series descriptors, this value is 0xD5.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) series descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a unique series identifier from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the series identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getseriesid
     */
    GetSeriesId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets a label that identifies a series repeat from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the repeat label. If this label is zero, the series is an original broadcast.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getrepeatlabel
     */
    GetRepeatLabel() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that indicates how often a series is programmed from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getprogrampattern
     */
    GetProgramPattern() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a series expiration date from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @param {Pointer<BOOL>} pfValid Receives a flag that indicates whether the series expiration date in the descriptor expire_date field is valid.
     * @param {Pointer<MPEG_DATE_AND_TIME>} pmdtVal Receives the date and time when the series expires.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getexpiredate
     */
    GetExpireDate(pfValid, pmdtVal) {
        pfValidMarshal := pfValid is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pfValidMarshal, pfValid, "ptr", pmdtVal, "HRESULT")
        return result
    }

    /**
     * Gets the episode number from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the episode number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getepisodenumber
     */
    GetEpisodeNumber() {
        result := ComCall(9, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the number of the last episode of a series from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @returns {Integer} Receives the last episode number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getlastepisodenumber
     */
    GetLastEpisodeNumber() {
        result := ComCall(10, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the series name from an Integrated Services Digital Broadcasting (ISDB) series descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the series name. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbseriesdescriptor-getseriesnamew
     */
    GetSeriesNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(11, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
