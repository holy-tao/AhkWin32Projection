#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) service descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbcaservicedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbCAServiceDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbCAServiceDescriptor
     * @type {Guid}
     */
    static IID => Guid("{39cbeb97-ff0b-42a7-9ab9-7b9cfe70a77a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCASystemId", "GetCABroadcasterGroupId", "GetMessageControl", "GetServiceIds"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getcabroadcastergroupid
     */
    GetCABroadcasterGroupId() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getmessagecontrol
     */
    GetMessageControl() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<Integer>} pbNumServiceIds 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcaservicedescriptor-getserviceids
     */
    GetServiceIds(pbNumServiceIds) {
        pbNumServiceIdsMarshal := pbNumServiceIds is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbNumServiceIdsMarshal, pbNumServiceIds, "ushort*", &pwServiceIds := 0, "HRESULT")
        return pwServiceIds
    }
}
