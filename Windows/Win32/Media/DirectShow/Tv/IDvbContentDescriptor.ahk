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
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-gettag
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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getlength
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
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getcountofrecords
     */
    GetCountOfRecords(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbValLevel1 
     * @param {Pointer<Integer>} pbValLevel2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getrecordcontentnibbles
     */
    GetRecordContentNibbles(bRecordIndex, pbValLevel1, pbValLevel2) {
        pbValLevel1Marshal := pbValLevel1 is VarRef ? "char*" : "ptr"
        pbValLevel2Marshal := pbValLevel2 is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "char", bRecordIndex, pbValLevel1Marshal, pbValLevel1, pbValLevel2Marshal, pbValLevel2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbVal1 
     * @param {Pointer<Integer>} pbVal2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbcontentdescriptor-getrecordusernibbles
     */
    GetRecordUserNibbles(bRecordIndex, pbVal1, pbVal2) {
        pbVal1Marshal := pbVal1 is VarRef ? "char*" : "ptr"
        pbVal2Marshal := pbVal2 is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "char", bRecordIndex, pbVal1Marshal, pbVal1, pbVal2Marshal, pbVal2, "HRESULT")
        return result
    }
}
