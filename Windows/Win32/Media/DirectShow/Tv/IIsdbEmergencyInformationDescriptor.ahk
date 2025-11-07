#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) emergency information descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbemergencyinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbEmergencyInformationDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbEmergencyInformationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{ba6fa681-b973-4da1-9207-ac3e7f0341eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetCountOfRecords", "GetServiceId", "GetStartEndFlag", "GetSignalLevel", "GetAreaCode"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getserviceid
     */
    GetServiceId(bRecordIndex) {
        result := ComCall(6, this, "char", bRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getstartendflag
     */
    GetStartEndFlag(bRecordIndex) {
        result := ComCall(7, this, "char", bRecordIndex, "char*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getsignallevel
     */
    GetSignalLevel(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Pointer<Pointer<Integer>>} ppwVal 
     * @param {Pointer<Integer>} pbNumAreaCodes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbemergencyinformationdescriptor-getareacode
     */
    GetAreaCode(bRecordIndex, ppwVal, pbNumAreaCodes) {
        ppwValMarshal := ppwVal is VarRef ? "ptr*" : "ptr"
        pbNumAreaCodesMarshal := pbNumAreaCodes is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "char", bRecordIndex, ppwValMarshal, ppwVal, pbNumAreaCodesMarshal, pbNumAreaCodes, "HRESULT")
        return result
    }
}
