#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that initializes the network data source CLSID_NetworkPlaces as specified.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iinitializenetworkfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeNetworkFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeNetworkFolder
     * @type {Guid}
     */
    static IID => Guid("{6e0f9881-42a8-4f2a-97f8-8af4e026d92d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<ITEMIDLIST>} pidlTarget 
     * @param {Integer} uDisplayType 
     * @param {PWSTR} pszResName 
     * @param {PWSTR} pszProvider 
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
    Initialize(pidl, pidlTarget, uDisplayType, pszResName, pszProvider) {
        pszResName := pszResName is String ? StrPtr(pszResName) : pszResName
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(3, this, "ptr", pidl, "ptr", pidlTarget, "uint", uDisplayType, "ptr", pszResName, "ptr", pszProvider, "HRESULT")
        return result
    }
}
