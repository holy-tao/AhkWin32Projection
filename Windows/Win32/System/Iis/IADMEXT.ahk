#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IADMEXT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADMEXT
     * @type {Guid}
     */
    static IID => Guid("{51dfe970-f6f2-11d0-b9bd-00a0c922e750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "EnumDcomCLSIDs", "Terminate"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
    Initialize() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsidDcom 
     * @param {Integer} dwEnumIndex 
     * @returns {HRESULT} 
     */
    EnumDcomCLSIDs(pclsidDcom, dwEnumIndex) {
        result := ComCall(4, this, "ptr", pclsidDcom, "uint", dwEnumIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
