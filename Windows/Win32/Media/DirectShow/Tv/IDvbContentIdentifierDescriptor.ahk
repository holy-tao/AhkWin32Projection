#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get information from a Digital Video Broadcast (DVB) content identifier descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvbcontentidentifierdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbContentIdentifierDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbContentIdentifierDescriptor
     * @type {Guid}
     */
    static IID => Guid("{05e0c1ea-f661-4053-9fbf-d93b28359838}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetRecordCrid"]

    /**
     * Gets the tag for a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Receives the content identifier descriptor tag. For content identifier descriptors, this tag value is "0x76".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Gets the descriptor body length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the number of service records in a Digital Video Broadcast (DVB) content identifier descriptor.
     * @returns {Integer} Receives the number of service records.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the content reference identifier (CRID) from a Digital Video Broadcast (DVB) content identifier descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the service record to return. To get the number of service records in the descriptor, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getcountofrecords">IDvbContentIdentifierDescriptor::GetCountOfRecords</a> method.
     * @param {Pointer<Integer>} pbType Receives the type of the CRID.
     * @param {Pointer<Integer>} pbLocation Gets the location of the CRID.
     * @param {Pointer<Integer>} pbLength Gets the number of bytes required to return the CRID.
     * @param {Pointer<Pointer<Integer>>} ppbBytes Pointer to a buffer that receives the CRID. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getrecordcrid
     */
    GetRecordCrid(bRecordIndex, pbType, pbLocation, pbLength, ppbBytes) {
        pbTypeMarshal := pbType is VarRef ? "char*" : "ptr"
        pbLocationMarshal := pbLocation is VarRef ? "char*" : "ptr"
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppbBytesMarshal := ppbBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pbTypeMarshal, pbType, pbLocationMarshal, pbLocation, pbLengthMarshal, pbLength, ppbBytesMarshal, ppbBytes, "HRESULT")
        return result
    }
}
