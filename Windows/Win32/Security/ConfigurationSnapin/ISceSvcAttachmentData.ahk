#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISceSvcAttachmentData interface retrieves configuration and analysis data about a specified security service from the Security Configuration snap-ins.
 * @see https://docs.microsoft.com/windows/win32/api//scesvc/nn-scesvc-iscesvcattachmentdata
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class ISceSvcAttachmentData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceSvcAttachmentData
     * @type {Guid}
     */
    static IID => Guid("{17c35fde-200d-11d1-affb-00c04fb984f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "Initialize", "FreeBuffer", "CloseHandle"]

    /**
     * 
     * @param {Pointer<Void>} scesvcHandle 
     * @param {Integer} sceType 
     * @param {Pointer<Pointer<Void>>} ppvData 
     * @param {Pointer<Integer>} psceEnumHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-getdata
     */
    GetData(scesvcHandle, sceType, ppvData, psceEnumHandle) {
        scesvcHandleMarshal := scesvcHandle is VarRef ? "ptr" : "ptr"
        ppvDataMarshal := ppvData is VarRef ? "ptr*" : "ptr"
        psceEnumHandleMarshal := psceEnumHandle is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, scesvcHandleMarshal, scesvcHandle, "int", sceType, ppvDataMarshal, ppvData, psceEnumHandleMarshal, psceEnumHandle, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Integer>} lpServiceName 
     * @param {Pointer<Integer>} lpTemplateName 
     * @param {ISceSvcAttachmentPersistInfo} lpSceSvcPersistInfo 
     * @param {Pointer<Pointer<Void>>} pscesvcHandle 
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
    Initialize(lpServiceName, lpTemplateName, lpSceSvcPersistInfo, pscesvcHandle) {
        lpServiceNameMarshal := lpServiceName is VarRef ? "char*" : "ptr"
        lpTemplateNameMarshal := lpTemplateName is VarRef ? "char*" : "ptr"
        pscesvcHandleMarshal := pscesvcHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, lpServiceNameMarshal, lpServiceName, lpTemplateNameMarshal, lpTemplateName, "ptr", lpSceSvcPersistInfo, pscesvcHandleMarshal, pscesvcHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentdata-freebuffer
     */
    FreeBuffer(pvData) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pvDataMarshal, pvData, "HRESULT")
        return result
    }

    /**
     * Closes an open object handle.
     * @param {Pointer<Void>} scesvcHandle 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * If the application is running under a debugger,  the function will throw an exception if it receives either a  handle value that is not valid  or a pseudo-handle value. This can happen if you close a handle twice, or if you  call 
     * <b>CloseHandle</b> on a handle returned by the 
     * <a href="/windows/desktop/api/fileapi/nf-fileapi-findfirstfilea">FindFirstFile</a> function instead of calling the <a href="/windows/desktop/api/fileapi/nf-fileapi-findclose">FindClose</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//handleapi/nf-handleapi-closehandle
     */
    CloseHandle(scesvcHandle) {
        scesvcHandleMarshal := scesvcHandle is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, scesvcHandleMarshal, scesvcHandle, "HRESULT")
        return result
    }
}
