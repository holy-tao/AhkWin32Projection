#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ISCTE_EAS interface enables the client to get data from an ATSC emergency alert message (EAS) table.
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iscte_eas
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISCTE_EAS extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCTE_EAS
     * @type {Guid}
     */
    static IID => Guid("{1ff544d6-161d-4fae-9faa-4f9f492ae999}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetSequencyNumber", "GetProtocolVersion", "GetEASEventID", "GetOriginatorCode", "GetEASEventCodeLen", "GetEASEventCode", "GetRawNatureOfActivationTextLen", "GetRawNatureOfActivationText", "GetNatureOfActivationText", "GetTimeRemaining", "GetStartTime", "GetDuration", "GetAlertPriority", "GetDetailsOOBSourceID", "GetDetailsMajor", "GetDetailsMinor", "GetDetailsAudioOOBSourceID", "GetAlertText", "GetRawAlertTextLen", "GetRawAlertText", "GetLocationCount", "GetLocationCodes", "GetExceptionCount", "GetExceptionService", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ISectionList} pSectionList 
     * @param {IMpeg2Data} pMPEGData 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pSectionList, pMPEGData) {
        result := ComCall(3, this, "ptr", pSectionList, "ptr", pMPEGData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getversionnumber
     */
    GetVersionNumber(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getsequencynumber
     */
    GetSequencyNumber(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getprotocolversion
     */
    GetProtocolVersion(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventid
     */
    GetEASEventID(pwVal) {
        result := ComCall(7, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getoriginatorcode
     */
    GetOriginatorCode(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcodelen
     */
    GetEASEventCodeLen(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcode
     */
    GetEASEventCode(pbVal) {
        result := ComCall(10, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtextlen
     */
    GetRawNatureOfActivationTextLen(pbVal) {
        result := ComCall(11, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtext
     */
    GetRawNatureOfActivationText(pbVal) {
        result := ComCall(12, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrIS0639code 
     * @param {Pointer<BSTR>} pbstrString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getnatureofactivationtext
     */
    GetNatureOfActivationText(bstrIS0639code, pbstrString) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        result := ComCall(13, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettimeremaining
     */
    GetTimeRemaining(pbVal) {
        result := ComCall(14, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getstarttime
     */
    GetStartTime(pdwVal) {
        result := ComCall(15, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getduration
     */
    GetDuration(pwVal) {
        result := ComCall(16, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getalertpriority
     */
    GetAlertPriority(pbVal) {
        result := ComCall(17, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsoobsourceid
     */
    GetDetailsOOBSourceID(pwVal) {
        result := ComCall(18, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsmajor
     */
    GetDetailsMajor(pwVal) {
        result := ComCall(19, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsminor
     */
    GetDetailsMinor(pwVal) {
        result := ComCall(20, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsaudiooobsourceid
     */
    GetDetailsAudioOOBSourceID(pwVal) {
        result := ComCall(21, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrIS0639code 
     * @param {Pointer<BSTR>} pbstrString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getalerttext
     */
    GetAlertText(bstrIS0639code, pbstrString) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        result := ComCall(22, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttextlen
     */
    GetRawAlertTextLen(pwVal) {
        result := ComCall(23, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttext
     */
    GetRawAlertText(pbVal) {
        result := ComCall(24, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcount
     */
    GetLocationCount(pbVal) {
        result := ComCall(25, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbState 
     * @param {Pointer<Integer>} pbCountySubdivision 
     * @param {Pointer<Integer>} pwCounty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcodes
     */
    GetLocationCodes(bIndex, pbState, pbCountySubdivision, pwCounty) {
        result := ComCall(26, this, "char", bIndex, "char*", pbState, "char*", pbCountySubdivision, "ushort*", pwCounty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptioncount
     */
    GetExceptionCount(pbVal) {
        result := ComCall(27, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bIndex 
     * @param {Pointer<Integer>} pbIBRef 
     * @param {Pointer<Integer>} pwFirst 
     * @param {Pointer<Integer>} pwSecond 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptionservice
     */
    GetExceptionService(bIndex, pbIBRef, pwFirst, pwSecond) {
        result := ComCall(28, this, "char", bIndex, "char*", pbIBRef, "ushort*", pwFirst, "ushort*", pwSecond, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors(pdwVal) {
        result := ComCall(29, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex, ppDescriptor) {
        result := ComCall(30, this, "uint", dwIndex, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie, ppDescriptor) {
        result := ComCall(31, this, "char", bTag, "uint*", pdwCookie, "ptr*", ppDescriptor, "HRESULT")
        return result
    }
}
