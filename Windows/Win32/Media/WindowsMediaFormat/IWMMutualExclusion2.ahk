#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMutualExclusion.ahk

/**
 * The IWMMutualExclusion2 interface provides advanced configuration features for mutual exclusion objects.This interface supports both multiple languages and advanced mutual exclusion.An IWMMutualExclusion2 interface is created for each mutual exclusion object created. To retrieve a pointer to an IWMMutualExclusion2 interface, call the QueryInterface method of the IWMMutualExclusion interface returned by IWMProfile::CreateNewMutualExclusion.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmutualexclusion2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMutualExclusion2 extends IWMMutualExclusion{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMutualExclusion2
     * @type {Guid}
     */
    static IID => Guid("{0302b57d-89d1-4ba2-85c9-166f2c53eb91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "SetName", "GetRecordCount", "AddRecord", "RemoveRecord", "GetRecordName", "SetRecordName", "GetStreamsForRecord", "AddStreamForRecord", "RemoveStreamForRecord"]

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getname
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-setname
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(9, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(10, this, "ushort*", &pwRecordCount := 0, "HRESULT")
        return pwRecordCount
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-addrecord
     */
    AddRecord() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-removerecord
     */
    RemoveRecord(wRecordNumber) {
        result := ComCall(12, this, "ushort", wRecordNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {PWSTR} pwszRecordName 
     * @param {Pointer<Integer>} pcchRecordName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getrecordname
     */
    GetRecordName(wRecordNumber, pwszRecordName, pcchRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        pcchRecordNameMarshal := pcchRecordName is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, "ushort", wRecordNumber, "ptr", pwszRecordName, pcchRecordNameMarshal, pcchRecordName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {PWSTR} pwszRecordName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-setrecordname
     */
    SetRecordName(wRecordNumber, pwszRecordName) {
        pwszRecordName := pwszRecordName is String ? StrPtr(pwszRecordName) : pwszRecordName

        result := ComCall(14, this, "ushort", wRecordNumber, "ptr", pwszRecordName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-getstreamsforrecord
     */
    GetStreamsForRecord(wRecordNumber, pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "ushort*" : "ptr"

        result := ComCall(15, this, "ushort", wRecordNumber, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-addstreamforrecord
     */
    AddStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(16, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion2-removestreamforrecord
     */
    RemoveStreamForRecord(wRecordNumber, wStreamNumber) {
        result := ComCall(17, this, "ushort", wRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }
}
