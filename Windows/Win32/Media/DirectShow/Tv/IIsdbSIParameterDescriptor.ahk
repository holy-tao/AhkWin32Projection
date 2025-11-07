#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MPEG_DATE.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) service information (SI) parameter descriptor. The SI parameter descriptor appears in the program map table (PMT) or network information table (NIT).
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbsiparameterdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbSIParameterDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbSIParameterDescriptor
     * @type {Guid}
     */
    static IID => Guid("{f837dc36-867c-426a-9111-f62093951a45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetParameterVersion", "GetUpdateTime", "GetRecordNumberOfTable", "GetTableId", "GetTableDescriptionLength", "GetTableDescriptionBytes"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getparameterversion
     */
    GetParameterVersion() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {MPEG_DATE} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getupdatetime
     */
    GetUpdateTime() {
        pVal := MPEG_DATE()
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable
     */
    GetRecordNumberOfTable() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettableid
     */
    GetTableId(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionlength
     */
    GetTableDescriptionLength(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Integer>} pbBufferLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionbytes
     */
    GetTableDescriptionBytes(bRecordIndex, pbBufferLength) {
        pbBufferLengthMarshal := pbBufferLength is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "char", bRecordIndex, pbBufferLengthMarshal, pbBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}
