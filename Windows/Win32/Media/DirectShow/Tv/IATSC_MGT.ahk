#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IGenericDescriptor.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005 and later.
 * @see https://docs.microsoft.com/windows/win32/api//atscpsipparser/nn-atscpsipparser-iatsc_mgt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IATSC_MGT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IATSC_MGT
     * @type {Guid}
     */
    static IID => Guid("{8877dabd-c137-4073-97e3-779407a5d87a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetProtocolVersion", "GetCountOfRecords", "GetRecordType", "GetRecordTypePid", "GetRecordVersionNumber", "GetRecordCountOfDescriptors", "GetRecordDescriptorByIndex", "GetRecordDescriptorByTag", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag"]

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
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getversionnumber
     */
    GetVersionNumber() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getprotocolversion
     */
    GetProtocolVersion() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getcountofrecords
     */
    GetCountOfRecords() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecordtype
     */
    GetRecordType(dwRecordIndex) {
        result := ComCall(7, this, "uint", dwRecordIndex, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecordtypepid
     */
    GetRecordTypePid(dwRecordIndex) {
        result := ComCall(8, this, "uint", dwRecordIndex, "ushort*", &ppidVal := 0, "HRESULT")
        return ppidVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecordversionnumber
     */
    GetRecordVersionNumber(dwRecordIndex) {
        result := ComCall(9, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecordcountofdescriptors
     */
    GetRecordCountOfDescriptors(dwRecordIndex) {
        result := ComCall(10, this, "uint", dwRecordIndex, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecorddescriptorbyindex
     */
    GetRecordDescriptorByIndex(dwRecordIndex, dwIndex) {
        result := ComCall(11, this, "uint", dwRecordIndex, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} dwRecordIndex 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getrecorddescriptorbytag
     */
    GetRecordDescriptorByTag(dwRecordIndex, bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwRecordIndex, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors(pdwVal) {
        pdwValMarshal := pdwVal is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwValMarshal, pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex) {
        result := ComCall(14, this, "uint", dwIndex, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {IGenericDescriptor} 
     * @see https://learn.microsoft.com/windows/win32/api/atscpsipparser/nf-atscpsipparser-iatsc_mgt-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "char", bTag, pdwCookieMarshal, pdwCookie, "ptr*", &ppDescriptor := 0, "HRESULT")
        return IGenericDescriptor(ppDescriptor)
    }
}
