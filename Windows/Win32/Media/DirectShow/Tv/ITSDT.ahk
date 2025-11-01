#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2psiparser/nn-mpeg2psiparser-itsdt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITSDT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITSDT
     * @type {Guid}
     */
    static IID => Guid("{d19bdb43-405b-4a7c-a791-c89110c33165}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetVersionNumber", "GetCountOfTableDescriptors", "GetTableDescriptorByIndex", "GetTableDescriptorByTag", "RegisterForNextTable", "GetNextTable", "RegisterForWhenCurrent", "ConvertNextToCurrent"]

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
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-getversionnumber
     */
    GetVersionNumber(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-getcountoftabledescriptors
     */
    GetCountOfTableDescriptors(pdwVal) {
        result := ComCall(5, this, "uint*", pdwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-gettabledescriptorbyindex
     */
    GetTableDescriptorByIndex(dwIndex, ppDescriptor) {
        result := ComCall(6, this, "uint", dwIndex, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bTag 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<IGenericDescriptor>} ppDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-gettabledescriptorbytag
     */
    GetTableDescriptorByTag(bTag, pdwCookie, ppDescriptor) {
        result := ComCall(7, this, "char", bTag, "uint*", pdwCookie, "ptr*", ppDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-registerfornexttable
     */
    RegisterForNextTable(hNextTableAvailable) {
        hNextTableAvailable := hNextTableAvailable is Win32Handle ? NumGet(hNextTableAvailable, "ptr") : hNextTableAvailable

        result := ComCall(8, this, "ptr", hNextTableAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITSDT>} ppTSDT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-getnexttable
     */
    GetNextTable(ppTSDT) {
        result := ComCall(9, this, "ptr*", ppTSDT, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hNextTableIsCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-registerforwhencurrent
     */
    RegisterForWhenCurrent(hNextTableIsCurrent) {
        hNextTableIsCurrent := hNextTableIsCurrent is Win32Handle ? NumGet(hNextTableIsCurrent, "ptr") : hNextTableIsCurrent

        result := ComCall(10, this, "ptr", hNextTableIsCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-itsdt-convertnexttocurrent
     */
    ConvertNextToCurrent() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
