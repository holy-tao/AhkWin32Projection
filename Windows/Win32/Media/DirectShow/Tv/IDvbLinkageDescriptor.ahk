#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Defines methods that get data from a Digital Video Broadcast (DVB) linkage descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-idvblinkagedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDvbLinkageDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvbLinkageDescriptor
     * @type {Guid}
     */
    static IID => Guid("{1cdf8b31-994a-46fc-acfd-6a6be8934dd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetTSId", "GetONId", "GetServiceId", "GetLinkageType", "GetPrivateDataLength", "GetPrivateData"]

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB linkage descriptors, this value is "0x4A".
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier of the transport stream containing the information service from a DVB linkage descriptor.
     * @returns {Integer} Receives the transport stream identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettsid
     */
    GetTSId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the network identifier of the broadcast system that originated an information service from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the network identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getonid
     */
    GetONId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the identifier that identifies an information service in a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the service identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getserviceid
     */
    GetServiceId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets a code that uniquely identifies the linkage type from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the linkage type code. For a list of linkage type codes, see Table 58 in Section 6.2.19 of the <i>DVB Specification for Service Information (SI) in DVB
     * systems
     * DVB (Document A038 Rev. 4)</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlinkagetype
     */
    GetLinkageType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the private data field from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the length of the private data field, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedatalength
     */
    GetPrivateDataLength() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the private data from a Digital Video Broadcast (DVB) linkage descriptor.
     * @param {Pointer<Integer>} pbLen On input, specifies the size of the buffer (pointed to by the <i>pbData</i> parameter) allocated for the private data, in bytes. On output, gets the actual length of the private  data that is received.
     * @returns {Integer} Receives private data from the DVB linkage descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedata
     */
    GetPrivateData(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbLenMarshal, pbLen, "char*", &pbData := 0, "HRESULT")
        return pbData
    }
}
