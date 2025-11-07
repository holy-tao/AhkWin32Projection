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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettsid
     */
    GetTSId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getonid
     */
    GetONId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getserviceid
     */
    GetServiceId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlinkagetype
     */
    GetLinkageType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedatalength
     */
    GetPrivateDataLength() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<Integer>} pbLen 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedata
     */
    GetPrivateData(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbLenMarshal, pbLen, "char*", &pbData := 0, "HRESULT")
        return pbData
    }
}
