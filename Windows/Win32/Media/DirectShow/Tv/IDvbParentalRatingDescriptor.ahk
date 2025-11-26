#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) parental rating descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbparentalratingdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbParentalRatingDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbParentalRatingDescriptor
     * @type {Guid}
     */
    static IID => Guid("{3ad9dde1-fb1b-4186-937f-22e6b5a72a10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordRating"]

    /**
     * Gets the tag that describes a Digital Video Broadcast (DVB) parental rating descriptor.
     * @returns {Integer} Receives the parental rating descriptor tag. This value is "0x55" for parental rating descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) parental rating descriptor, in bytes,.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of records in a Digital Video Broadcast (DVB) parental rating descriptor.
     * @returns {Integer} Receives the number of records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets a code that indicates the age-based rating for a Digital Video Broadcast (DVB) broadcast from a DVB parental rating descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the descriptor to return. To get the number of descriptors, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getcountofrecords">IDvbParentalRatingDescriptor::GetCountOfRecords</a>.
     * @param {Pointer<Integer>} pszCountryCode Receives the ISO 3166 country code from the parental rating descriptor.
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbparentalratingdescriptor-getrecordrating
     */
    GetRecordRating(bRecordIndex, pszCountryCode, pbVal) {
        pszCountryCodeMarshal := pszCountryCode is VarRef ? "char*" : "ptr"
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pszCountryCodeMarshal, pszCountryCode, pbValMarshal, pbVal, "HRESULT")
        return result
    }
}
