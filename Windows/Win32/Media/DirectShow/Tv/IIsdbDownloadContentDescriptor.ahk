#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettag
     */
    GetTag(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getlength
     */
    GetLength(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbValMarshal, pbVal, "HRESULT")
        return result
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
        result := ComCall(5, this, "ptr", pfReboot, "ptr", pfAddOn, "ptr", pfCompatibility, "ptr", pfModuleInfo, "ptr", pfTextInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponentsize
     */
    GetComponentSize(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getdownloadid
     */
    GetDownloadId(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettimeoutvaluedii
     */
    GetTimeOutValueDII(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getleakrate
     */
    GetLeakRate(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcomponenttag
     */
    GetComponentTag(pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptorlength
     */
    GetCompatiblityDescriptorLength(pwLength) {
        pwLengthMarshal := pwLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pwLengthMarshal, pwLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcompatiblitydescriptor
     */
    GetCompatiblityDescriptor(ppbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, ppbDataMarshal, ppbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getcountofrecords
     */
    GetCountOfRecords(pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(13, this, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleid
     */
    GetRecordModuleId(wRecordIndex, pwVal) {
        pwValMarshal := pwVal is VarRef ? "ushort*" : "ptr"

        result := ComCall(14, this, "ushort", wRecordIndex, pwValMarshal, pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmodulesize
     */
    GetRecordModuleSize(wRecordIndex, pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ushort", wRecordIndex, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfolength
     */
    GetRecordModuleInfoLength(wRecordIndex, pbVal) {
        pbValMarshal := pbVal is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "ushort", wRecordIndex, pbValMarshal, pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-getrecordmoduleinfo
     */
    GetRecordModuleInfo(wRecordIndex, ppbData) {
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ushort", wRecordIndex, ppbDataMarshal, ppbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} szCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextlanguagecode
     */
    GetTextLanguageCode(szCode) {
        szCodeMarshal := szCode is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, szCodeMarshal, szCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbdownloadcontentdescriptor-gettextw
     */
    GetTextW(convMode, pbstrName) {
        result := ComCall(19, this, "int", convMode, "ptr", pbstrName, "HRESULT")
        return result
    }
}
