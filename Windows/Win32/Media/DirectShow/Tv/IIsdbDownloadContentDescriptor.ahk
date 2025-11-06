#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbdownloadcontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDownloadContentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbDownloadContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{5298661e-cb88-4f5f-a1de-5f440c185b92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetFlags", "GetComponentSize", "GetDownloadId", "GetTimeOutValueDII", "GetLeakRate", "GetComponentTag", "GetCompatiblityDescriptorLength", "GetCompatiblityDescriptor", "GetCountOfRecords", "GetRecordModuleId", "GetRecordModuleSize", "GetRecordModuleInfoLength", "GetRecordModuleInfo", "GetTextLanguageCode", "GetTextW"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfReboot 
     * @param {Pointer<BOOL>} pfAddOn 
     * @param {Pointer<BOOL>} pfCompatibility 
     * @param {Pointer<BOOL>} pfModuleInfo 
     * @param {Pointer<BOOL>} pfTextInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getflags
     */
    GetFlags(pfReboot, pfAddOn, pfCompatibility, pfModuleInfo, pfTextInfo) {
        pfRebootMarshal := pfReboot is VarRef ? "int*" : "ptr"
        pfAddOnMarshal := pfAddOn is VarRef ? "int*" : "ptr"
        pfCompatibilityMarshal := pfCompatibility is VarRef ? "int*" : "ptr"
        pfModuleInfoMarshal := pfModuleInfo is VarRef ? "int*" : "ptr"
        pfTextInfoMarshal := pfTextInfo is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pfRebootMarshal, pfReboot, pfAddOnMarshal, pfAddOn, pfCompatibilityMarshal, pfCompatibility, pfModuleInfoMarshal, pfModuleInfo, pfTextInfoMarshal, pfTextInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponentsize
     */
    GetComponentSize() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getdownloadid
     */
    GetDownloadId() {
        result := ComCall(7, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettimeoutvaluedii
     */
    GetTimeOutValueDII() {
        result := ComCall(8, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getleakrate
     */
    GetLeakRate() {
        result := ComCall(9, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptorlength
     */
    GetCompatiblityDescriptorLength() {
        result := ComCall(11, this, "ushort*", &pwLength := 0, "HRESULT")
        return pwLength
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptor
     */
    GetCompatiblityDescriptor() {
        result := ComCall(12, this, "ptr*", &ppbData := 0, "HRESULT")
        return ppbData
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(13, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleid
     */
    GetRecordModuleId(wRecordIndex) {
        result := ComCall(14, this, "ushort", wRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmodulesize
     */
    GetRecordModuleSize(wRecordIndex) {
        result := ComCall(15, this, "ushort", wRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfolength
     */
    GetRecordModuleInfoLength(wRecordIndex) {
        result := ComCall(16, this, "ushort", wRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfo
     */
    GetRecordModuleInfo(wRecordIndex) {
        result := ComCall(17, this, "ushort", wRecordIndex, "ptr*", &ppbData := 0, "HRESULT")
        return ppbData
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextlanguagecode
     */
    GetTextLanguageCode() {
        result := ComCall(18, this, "char*", &szCode := 0, "HRESULT")
        return szCode
    }

    /**
     * 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrName := BSTR()
        result := ComCall(19, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }
}
