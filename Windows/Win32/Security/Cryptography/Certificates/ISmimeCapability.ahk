#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an SMIMECapabilities extension that identifies the decryption capabilities of an email recipient.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ismimecapability
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ISmimeCapability extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmimeCapability
     * @type {Guid}
     */
    static IID => Guid("{728ab319-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_ObjectId", "get_BitCount"]

    /**
     * @type {IObjectId} 
     */
    ObjectId {
        get => this.get_ObjectId()
    }

    /**
     * @type {Integer} 
     */
    BitCount {
        get => this.get_BitCount()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IObjectId} pObjectId 
     * @param {Integer} BitCount 
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
    Initialize(pObjectId, BitCount) {
        result := ComCall(7, this, "ptr", pObjectId, "int", BitCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ismimecapability-get_objectid
     */
    get_ObjectId() {
        result := ComCall(8, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ismimecapability-get_bitcount
     */
    get_BitCount() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
