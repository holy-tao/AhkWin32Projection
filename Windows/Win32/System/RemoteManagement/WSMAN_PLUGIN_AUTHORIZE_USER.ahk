#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Authorizes a connection.
 * @remarks
 * The plug-in must call <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzusercomplete">WSManPluginAuthzUserComplete</a> to report either that the user was successfully authorized with <b>NO_ERROR</b> or that the user was not authorized with <b>ERROR_ACCESS_DENIED</b>. An <b>ERROR_WSMAN_REDIRECT_REQUIRED</b> error should be reported if an HTTP redirect is required for this user, and the new HTTP URI should be recorded in <i>extendedErrorInformation</i> of the <b>WSManPluginAuthzUserComplete</b> method. All other errors report a failure to the client, but no specific information is reported.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_authorize_user
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_AUTHORIZE_USER extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} pluginContext 
     * @param {Pointer<WSMAN_SENDER_DETAILS>} senderDetails 
     * @param {Integer} flags 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pluginContext, senderDetails, flags) {
        pluginContextMarshal := pluginContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, pluginContextMarshal, pluginContext, "ptr", senderDetails, "uint", flags)
    }
}
