#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented to create and initialize objects to provide a specified access interface to a resource represented by the function instance. After the object is created, the Initialize method is called to initialize the object.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryserviceprovider
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{4c81ed02-1b04-43f2-a451-69966cbcd1c2}")

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
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
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
    Initialize(pIFunctionInstance, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pIFunctionInstance, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
