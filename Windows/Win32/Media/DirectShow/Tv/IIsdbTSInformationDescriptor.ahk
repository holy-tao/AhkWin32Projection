#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) transport stream (TS) information descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbtsinformationdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbTSInformationDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbTSInformationDescriptor
     * @type {Guid}
     */
    static IID => Guid("{d7ad183e-38f5-4210-b55f-ec8d601bbd47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetRemoteControlKeyId", "GetTSNameW", "GetCountOfRecords", "GetRecordTransmissionTypeInfo", "GetRecordNumberOfServices", "GetRecordServiceIdByIndex"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getremotecontrolkeyid
     */
    GetRemoteControlKeyId() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-gettsnamew
     */
    GetTSNameW(convMode) {
        pbstrName := BSTR()
        result := ComCall(6, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordtransmissiontypeinfo
     */
    GetRecordTransmissionTypeInfo(bRecordIndex) {
        result := ComCall(8, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordnumberofservices
     */
    GetRecordNumberOfServices(bRecordIndex) {
        result := ComCall(9, this, "char", bRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} bRecordIndex 
     * @param {Integer} bServiceIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbtsinformationdescriptor-getrecordserviceidbyindex
     */
    GetRecordServiceIdByIndex(bRecordIndex, bServiceIndex) {
        result := ComCall(10, this, "char", bRecordIndex, "char", bServiceIndex, "ushort*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }
}
