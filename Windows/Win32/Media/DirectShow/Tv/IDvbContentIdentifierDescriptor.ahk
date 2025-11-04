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
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-gettag
     */
    GetTag(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getlength
     */
    GetLength(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbType 
     * @param {Pointer<Integer>} pbLocation 
     * @param {Pointer<Integer>} pbLength 
     * @param {Pointer<Pointer<Integer>>} ppbBytes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentidentifierdescriptor-getrecordcrid
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
