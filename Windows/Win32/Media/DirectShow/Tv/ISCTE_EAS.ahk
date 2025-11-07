#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IGenericDescriptor.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getsequencynumber
     */
    GetSequencyNumber() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getprotocolversion
     */
    GetProtocolVersion() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventid
     */
    GetEASEventID() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getoriginatorcode
     */
    GetOriginatorCode() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcodelen
     */
    GetEASEventCodeLen() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-geteaseventcode
     */
    GetEASEventCode() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtextlen
     */
    GetRawNatureOfActivationTextLen() {
        result := ComCall(11, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawnatureofactivationtext
     */
    GetRawNatureOfActivationText() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {BSTR} bstrIS0639code 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getnatureofactivationtext
     */
    GetNatureOfActivationText(bstrIS0639code) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        pbstrString := BSTR()
        result := ComCall(13, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return pbstrString
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettimeremaining
     */
    GetTimeRemaining() {
        result := ComCall(14, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getstarttime
     */
    GetStartTime() {
        result := ComCall(15, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getduration
     */
    GetDuration() {
        result := ComCall(16, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getalertpriority
     */
    GetAlertPriority() {
        result := ComCall(17, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsoobsourceid
     */
    GetDetailsOOBSourceID() {
        result := ComCall(18, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsmajor
     */
    GetDetailsMajor() {
        result := ComCall(19, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsminor
     */
    GetDetailsMinor() {
        result := ComCall(20, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getdetailsaudiooobsourceid
     */
    GetDetailsAudioOOBSourceID() {
        result := ComCall(21, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {BSTR} bstrIS0639code 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getalerttext
     */
    GetAlertText(bstrIS0639code) {
        bstrIS0639code := bstrIS0639code is String ? BSTR.Alloc(bstrIS0639code).Value : bstrIS0639code

        pbstrString := BSTR()
        result := ComCall(22, this, "ptr", bstrIS0639code, "ptr", pbstrString, "HRESULT")
        return pbstrString
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttextlen
     */
    GetRawAlertTextLen() {
        result := ComCall(23, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getrawalerttext
     */
    GetRawAlertText() {
        result := ComCall(24, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getlocationcount
     */
    GetLocationCount() {
        result := ComCall(25, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
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
        pbStateMarshal := pbState is VarRef ? "char*" : "ptr"
        pbCountySubdivisionMarshal := pbCountySubdivision is VarRef ? "char*" : "ptr"
        pwCountyMarshal := pwCounty is VarRef ? "ushort*" : "ptr"

        result := ComCall(26, this, "char", bIndex, pbStateMarshal, pbState, pbCountySubdivisionMarshal, pbCountySubdivision, pwCountyMarshal, pwCounty, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getexceptioncount
     */
    GetExceptionCount() {
        result := ComCall(27, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
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
        pbIBRefMarshal := pbIBRef is VarRef ? "char*" : "ptr"
        pwFirstMarshal := pwFirst is VarRef ? "ushort*" : "ptr"
        pwSecondMarshal := pwSecond is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "char", bIndex, pbIBRefMarshal, pbIBRef, pwFirstMarshal, pwFirst, pwSecondMarshal, pwSecond, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors() {
        result := ComCall(29, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(30, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iscte_eas-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }
}
