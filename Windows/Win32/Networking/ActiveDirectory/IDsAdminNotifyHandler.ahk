#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNotifyHandler interface is implemented by an Active Directory administrative notification handler.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadminnotifyhandler
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNotifyHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminNotifyHandler
     * @type {Guid}
     */
    static IID => Guid("{e4a2b8b3-5a18-11d2-97c1-00a0c9a06d2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Begin", "Notify", "End"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDataObject} pExtraInfo 
     * @param {Pointer<Integer>} puEventFlags 
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
    Initialize(pExtraInfo, puEventFlags) {
        result := ComCall(3, this, "ptr", pExtraInfo, "uint*", puEventFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uEvent 
     * @param {IDataObject} pArg1 
     * @param {IDataObject} pArg2 
     * @param {Pointer<Integer>} puFlags 
     * @param {Pointer<BSTR>} pBstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-begin
     */
    Begin(uEvent, pArg1, pArg2, puFlags, pBstr) {
        result := ComCall(4, this, "uint", uEvent, "ptr", pArg1, "ptr", pArg2, "uint*", puFlags, "ptr", pBstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItem 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-notify
     */
    Notify(nItem, uFlags) {
        result := ComCall(5, this, "uint", nItem, "uint", uFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnotifyhandler-end
     */
    End() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
