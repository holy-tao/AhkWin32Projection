#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by an application or component to programmatically start a creation wizard for a specified object class.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadmincreateobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminCreateObj extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminCreateObj
     * @type {Guid}
     */
    static IID => Guid("{53554a38-f902-11d2-82b9-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "CreateModal"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IADsContainer} pADsContainerObj 
     * @param {IADs} pADsCopySource 
     * @param {PWSTR} lpszClassName 
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
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IADs>} ppADsObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadmincreateobj-createmodal
     */
    CreateModal(hwndParent, ppADsObj) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(4, this, "ptr", hwndParent, "ptr*", ppADsObj, "HRESULT")
        return result
    }
}
