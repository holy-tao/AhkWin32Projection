#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * Exposes a method that initializes Shell folder objects.
 * @remarks
 * 
  * When you implement a Shell namespace extension, specifically the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, you must implement this interface so the folder object can be initialized. Implementation of this interface is how the folder is told where it is in the Shell namespace.
  * 
  * You do not use this interface directly. It is used by the file system implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-bindtoobject">IShellFolder::BindToObject</a> interface when it is initializing a Shell folder object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ipersistfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPersistFolder extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistFolder
     * @type {Guid}
     */
    static IID => Guid("{000214ea-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<ITEMIDLIST>} pidl 
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
    Initialize(pidl) {
        result := ComCall(4, this, "ptr", pidl, "HRESULT")
        return result
    }
}
