#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Gets data from an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdb_emm
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IISDB_EMM extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IISDB_EMM
     * @type {Guid}
     */
    static IID => Guid("{0edb556d-43ad-4938-9668-321b2ffecfd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetTableIdExtension", "GetDataBytes", "GetSharedEmmMessage", "GetIndividualEmmMessage", "GetVersionHash"]

    /**
     * Initializes the data elements of an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table by using the list of MPEG-2 EMM sections.
     * @param {ISectionList} pSectionList Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-isectionlist">ISectionList</a> interface for the
     * MPEG-2 ISDB EMM section list.
     * @param {IMpeg2Data} pMPEGData Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2data/nn-mpeg2data-impeg2data">IMpeg2Data</a> interface of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg-2-sections-and-tables-filter">MPEG-2 Sections and Tables</a> filter.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * Gets the version number for an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @returns {Integer} Receives the version_number field.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a table_id_extension field identifying a subtable within an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @returns {Integer} Receives the table_id field value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-gettableidextension
     */
    GetTableIdExtension() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the data from an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @param {Pointer<Integer>} pwBufferLength On input, specifies the length in bytes of the buffer (specified in the <i>pbBuffer</i> parameter) that receives the EMM table data. On output, gets the actual length of the data returned in <i>pbBuffer</i>.
     * @returns {Integer} Receives the data from the EMM table.
     * The allocated size of this buffer must be greater than or equal to the value
     * that the <i>pwBufferLength</i> parameter points to.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-getdatabytes
     */
    GetDataBytes(pwBufferLength) {
        pwBufferLengthMarshal := pwBufferLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pwBufferLengthMarshal, pwBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    /**
     * Gets a shared message from an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @param {Pointer<Integer>} pwLength Receives the length of the buffer required to hold the message.
     * @param {Pointer<Pointer<Integer>>} ppbMessage Pointer to a memory block allocated to receive the shared message object.
     *   The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-getsharedemmmessage
     */
    GetSharedEmmMessage(pwLength, ppbMessage) {
        pwLengthMarshal := pwLength is VarRef ? "ushort*" : "ptr"
        ppbMessageMarshal := ppbMessage is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, pwLengthMarshal, pwLength, ppbMessageMarshal, ppbMessage, "HRESULT")
        return result
    }

    /**
     * Gets an individual message from an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @param {IUnknown} pUnknown Pointer to the <b>IUnknown</b> interface for the object that contains the EMM table.
     * @param {Pointer<Integer>} pwLength Receives the length of the buffer required to hold the message.
     * @param {Pointer<Pointer<Integer>>} ppbMessage Pointer to a memory block allocated to receive the message object.
     *   The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-getindividualemmmessage
     */
    GetIndividualEmmMessage(pUnknown, pwLength, ppbMessage) {
        pwLengthMarshal := pwLength is VarRef ? "ushort*" : "ptr"
        ppbMessageMarshal := ppbMessage is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pUnknown, pwLengthMarshal, pwLength, ppbMessageMarshal, ppbMessage, "HRESULT")
        return result
    }

    /**
     * Returns a hash value for this instance of an Integrated Services Digital Broadcasting (ISDB) entitlement management message (EMM) table.
     * @returns {Integer} Receives the hash value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdb_emm-getversionhash
     */
    GetVersionHash() {
        result := ComCall(9, this, "uint*", &pdwVersionHash := 0, "HRESULT")
        return pdwVersionHash
    }
}
