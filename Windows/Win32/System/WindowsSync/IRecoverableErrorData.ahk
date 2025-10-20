#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about a recoverable error.
 * @remarks
 * 
  * To communicate additional information that is not supported by this interface, implement an object that inherits from <b>IRecoverableErrorData</b> and also from a custom interface. When the application receives the <b>IRecoverableErrorData</b> object in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onrecoverableerror">ISyncCallback::OnRecoverableError</a> method, the application can call <b>QueryInterface</b> on the <b>IRecoverableErrorData</b> object to obtain the custom interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irecoverableerrordata
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRecoverableErrorData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRecoverableErrorData
     * @type {Guid}
     */
    static IID => Guid("{b37c4a0a-4b7d-4c2d-9711-3b00d119b1c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetItemDisplayName", "GetErrorDescription"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pcszItemDisplayName 
     * @param {PWSTR} pcszErrorDescription 
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
    Initialize(pcszItemDisplayName, pcszErrorDescription) {
        pcszItemDisplayName := pcszItemDisplayName is String ? StrPtr(pcszItemDisplayName) : pcszItemDisplayName
        pcszErrorDescription := pcszErrorDescription is String ? StrPtr(pcszErrorDescription) : pcszErrorDescription

        result := ComCall(3, this, "ptr", pcszItemDisplayName, "ptr", pcszErrorDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszItemDisplayName 
     * @param {Pointer<Integer>} pcchItemDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerrordata-getitemdisplayname
     */
    GetItemDisplayName(pszItemDisplayName, pcchItemDisplayName) {
        pszItemDisplayName := pszItemDisplayName is String ? StrPtr(pszItemDisplayName) : pszItemDisplayName

        result := ComCall(4, this, "ptr", pszItemDisplayName, "uint*", pcchItemDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszErrorDescription 
     * @param {Pointer<Integer>} pcchErrorDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerrordata-geterrordescription
     */
    GetErrorDescription(pszErrorDescription, pcchErrorDescription) {
        pszErrorDescription := pszErrorDescription is String ? StrPtr(pszErrorDescription) : pszErrorDescription

        result := ComCall(5, this, "ptr", pszErrorDescription, "uint*", pcchErrorDescription, "HRESULT")
        return result
    }
}
