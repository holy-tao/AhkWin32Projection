#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a COM+ server application is loaded, shut down, or paused.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomapp2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComApp2Events extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComApp2Events
     * @type {Guid}
     */
    static IID => Guid("{1290bc1a-b219-418d-b078-5934ded08242}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAppActivation2", "OnAppShutdown2", "OnAppForceShutdown2", "OnAppPaused2", "OnAppRecycle2"]

    /**
     * Generated when the server application process is loaded.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @param {Guid} guidProcess The process ID.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomapp2events-onappactivation2
     */
    OnAppActivation2(pInfo, guidApp, guidProcess) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "HRESULT")
        return result
    }

    /**
     * Generated when the server application shuts down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomapp2events-onappshutdown2
     */
    OnAppShutdown2(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when the server application is forced to shut down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomapp2events-onappforceshutdown2
     */
    OnAppForceShutdown2(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when the server application is paused or resumed to its initial state.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @param {BOOL} bPaused <b>TRUE</b> if the server application is paused. <b>FALSE</b> if the application has resumed to its original state.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomapp2events-onapppaused2
     */
    OnAppPaused2(pInfo, guidApp, bPaused) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidApp, "int", bPaused, "HRESULT")
        return result
    }

    /**
     * Generated when the server application process is marked for recycling termination.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The application ID.
     * @param {Guid} guidProcess The process ID.
     * @param {Integer} lReason The reason code that explains why a process was recycled. The following codes are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_NO_REASON_SUPPLIED"></a><a id="crr_no_reason_supplied"></a><dl>
     * <dt><b>CRR_NO_REASON_SUPPLIED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reason is not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_LIFETIME_LIMIT"></a><a id="crr_lifetime_limit"></a><dl>
     * <dt><b>CRR_LIFETIME_LIMIT</b></dt>
     * <dt>xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of minutes that an application runs before recycling was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_ACTIVATION_LIMIT"></a><a id="crr_activation_limit"></a><dl>
     * <dt><b>CRR_ACTIVATION_LIMIT</b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of activations was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_CALL_LIMIT"></a><a id="crr_call_limit"></a><dl>
     * <dt><b>CRR_CALL_LIMIT</b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of calls to configured objects in the application was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_MEMORY_LIMIT"></a><a id="crr_memory_limit"></a><dl>
     * <dt><b>CRR_MEMORY_LIMIT</b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified memory usage that a process cannot exceed was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_RECYCLED_FROM_UI"></a><a id="crr_recycled_from_ui"></a><dl>
     * <dt><b>CRR_RECYCLED_FROM_UI</b></dt>
     * <dt>xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator decided to recycle the process through the Component Services administration tool.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-icomapp2events-onapprecycle2
     */
    OnAppRecycle2(pInfo, guidApp, guidProcess, lReason) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "int", lReason, "HRESULT")
        return result
    }
}
