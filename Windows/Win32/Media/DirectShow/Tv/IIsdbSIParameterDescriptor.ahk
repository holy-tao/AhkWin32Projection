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
     * Gets the tag that identifies a service information (SI) parameter descriptor.
     * @returns {Integer} Receives the tag value. For SI parameter descriptors, this value is 0xD7.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a service information (SI) parameter descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the version number of a parameter from a service information (SI) parameter descriptor. This version number is incremented by one each time the parameter is updated.
     * @returns {Integer} Receives the version number.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getparameterversion
     */
    GetParameterVersion() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the time at which a parameter becomes valid from a service information (SI) parameter descriptor.
     * @returns {MPEG_DATE} Receives the date/time value that indicates when the parameter becomes valid.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getupdatetime
     */
    GetUpdateTime() {
        pVal := MPEG_DATE()
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of table descriptors in a service information (SI) parameter descriptor.
     * @returns {Integer} Receives the number of table descriptors.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable
     */
    GetRecordNumberOfTable() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets an identifier for a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @returns {Integer} Receives the table descriptor identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettableid
     */
    GetTableId(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @returns {Integer} Receives the length of the table descriptor, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionlength
     */
    GetTableDescriptionLength(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets description data from a table descriptor in a service information (SI) parameter descriptor.
     * @param {Integer} bRecordIndex Zero-based index of the SI table descriptor. To get the number of table descriptors, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-getrecordnumberoftable">IIsdbSIParameterDescriptor::GetRecordNumberOfTable</a> method.
     * @param {Pointer<Integer>} pbBufferLength On input specifies the length of the table descriptor data that is retrieved, in bytes. On output returns the actual data length.
     * @returns {Integer} Receives the table descriptor data.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbsiparameterdescriptor-gettabledescriptionbytes
     */
    GetTableDescriptionBytes(bRecordIndex, pbBufferLength) {
        pbBufferLengthMarshal := pbBufferLength is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "char", bRecordIndex, pbBufferLengthMarshal, pbBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}
