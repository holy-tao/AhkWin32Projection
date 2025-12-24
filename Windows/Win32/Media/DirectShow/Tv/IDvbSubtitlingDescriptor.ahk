#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) subtitling descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbsubtitlingdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbSubtitlingDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbSubtitlingDescriptor
     * @type {Guid}
     */
    static IID => Guid("{9b25fe1d-fa23-4e50-9784-6df8b26f8a49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordLangId", "GetRecordSubtitlingType", "GetRecordCompositionPageID", "GetRecordAncillaryPageID"]

    /**
     * Gets the tag for a Digital Video Broadcast (DVB) subtitling descriptor.
     * @returns {Integer} Receives the subtitling descriptor tag. For subtitling descriptors, this tag value is "0x59".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) subtitling descriptor.
     * @returns {Integer} Receives the number of bytes in the descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of subtitling records in a Digital Video Broadcast (DVB) subtitling descriptor.
     * @returns {Integer} Returns the number of subtitling records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the three-character ISO 639 language code from a Digital Video Broadcast (DVB) subtitling descriptor. This code identifies the language used for subtitles.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getcountofrecords">IDvbSubtitlingDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Pointer to a buffer that receives the language code. For a list of language codes, refer to <a href="http://www.sil.org/ISO639-3/codes.asp">this document</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getrecordlangid
     */
    GetRecordLangId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "uint*", &pulVal := 0, "HRESULT")
        return pulVal
    }

    /**
     * Gets the subtitling component type from a DVB subtitling descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getcountofrecords">IDvbSubtitlingDescriptor::GetCountOfRecords</a>
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getrecordsubtitlingtype
     */
    GetRecordSubtitlingType(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the composition page identifier for a Digital Video Broadcast (DVB) subtitling descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getcountofrecords">IDvbSubtitlingDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the composition page identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getrecordcompositionpageid
     */
    GetRecordCompositionPageID(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the ancillary page identifier for a Digital Video Broadcast (DVB) subtitling descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getcountofrecords">IDvbSubtitlingDescriptor::GetCountOfRecords</a>
     * @returns {Integer} Receives the ancillary page identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbsubtitlingdescriptor-getrecordancillarypageid
     */
    GetRecordAncillaryPageID(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }
}
