#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbcadescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbCADescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbCADescriptor
     * @type {Guid}
     */
    static IID => Guid("{0570aa47-52bc-42ae-8ca5-969f41e81aea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCASystemId", "GetReservedBits", "GetCAPID", "GetPrivateDataBytes"]

    /**
     * Gets the tag that identifies a conditional access (CA) descriptor.
     * @returns {Integer} Receives the tag value. For conditional access descriptors, this value is 0x09.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a conditional access (CA) descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) system identifier from a conditional access descriptor.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the reserved bits from a conditional access (CA) descriptor.
     * @returns {Integer} Receives the reserved bits.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getreservedbits
     */
    GetReservedBits() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) program identifier (PID) from a conditional access descriptor.
     * @returns {Integer} Receives the conditional access PID value.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getcapid
     */
    GetCAPID() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the private data bytes from a conditional access (CA) descriptor.
     * @param {Pointer<Integer>} pbBufferLength On input, specifies the length of the private data being retrieved, in bytes. On output, returns the actual data length.
     * @returns {Integer} Receives the conditional access private data.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getprivatedatabytes
     */
    GetPrivateDataBytes(pbBufferLength) {
        pbBufferLengthMarshal := pbBufferLength is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbBufferLengthMarshal, pbBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }
}
