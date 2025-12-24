#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to manage a COM+ object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicepool
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServicePool extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServicePool
     * @type {Guid}
     */
    static IID => Guid("{b302df81-ea45-451e-99a2-09f9fd1b1e13}")

    /**
     * The class identifier for ServicePool
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0c9-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetObject", "Shutdown"]

    /**
     * Initializes an object pool.
     * @param {IUnknown} pPoolConfig An object supporting the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicepoolconfig">IServicePoolConfig</a> interface that describes the configuration of the object pool.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ALREADYINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/comsvcs/nf-comsvcs-iservicepool-initialize">Initialize</a> has already been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepool-initialize
     */
    Initialize(pPoolConfig) {
        result := ComCall(3, this, "ptr", pPoolConfig, "HRESULT")
        return result
    }

    /**
     * Retrieves an object from the object pool.
     * @param {Pointer<Guid>} riid A reference to the identifier of the object requested.
     * @param {Pointer<Pointer<Void>>} ppv The requested object.
     * @returns {HRESULT} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ACTIVATION_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object activation failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ACTIVATIONFAILED_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object activation failed due to time-out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object pool was not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepool-getobject
     */
    GetObject(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Shuts down an object pool.
     * @returns {HRESULT} This method returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicepool-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
