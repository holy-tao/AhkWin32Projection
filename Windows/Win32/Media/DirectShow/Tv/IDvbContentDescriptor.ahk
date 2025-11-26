#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from a Digital Video Broadcast (DVB) content descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbcontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbContentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{2e883881-a467-412a-9d63-6f2b6da05bf0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordContentNibbles", "GetRecordUserNibbles"]

    /**
     * Gets the tag for a Digital Video Broadcast (DVB) content descriptor.
     * @returns {Integer} Receives the content descriptor tag. For content descriptors, this tag value is "0x54".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) content descriptor.
     * @returns {Integer} Receives the content descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of content elements within a Digital Video Broadcast (DVB) content descriptor.
     * @returns {Integer} Receives the number of content elements.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the two 4-bit fields that make up a DVB-defined identifier for a content descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords">IDvbContentDescriptor::GetCountOfRecords</a>
     * @param {Pointer<Integer>} pbValLevel1 Gets the most-significant four bits of the content identifier.
     * @param {Pointer<Integer>} pbValLevel2 Gets the least-significant four bits of the content identifier.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getrecordcontentnibbles
     */
    GetRecordContentNibbles(bRecordIndex, pbValLevel1, pbValLevel2) {
        pbValLevel1Marshal := pbValLevel1 is VarRef ? "char*" : "ptr"
        pbValLevel2Marshal := pbValLevel2 is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pbValLevel1Marshal, pbValLevel1, pbValLevel2Marshal, pbValLevel2, "HRESULT")
        return result
    }

    /**
     * Gets the two 4-bit fields that make up a broadcaster-defined identifier for a content descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords">IDvbContentDescriptor::GetCountOfRecords</a>
     * @param {Pointer<Integer>} pbVal1 Gets the most-significant four bits of the broadcaster-defined content identifier. These bits are returned in the  right-most four bits of the byte.
     * @param {Pointer<Integer>} pbVal2 Gets the least-significant four bits of the broadcaster-defined  content identifier. These bits are returned in the left-most four bits of the byte.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getrecordusernibbles
     */
    GetRecordUserNibbles(bRecordIndex, pbVal1, pbVal2) {
        pbVal1Marshal := pbVal1 is VarRef ? "char*" : "ptr"
        pbVal2Marshal := pbVal2 is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pbVal1Marshal, pbVal1, pbVal2Marshal, pbVal2, "HRESULT")
        return result
    }
}
