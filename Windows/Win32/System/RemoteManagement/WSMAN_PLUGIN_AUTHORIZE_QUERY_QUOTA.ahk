#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves quota information for the user after a connection has been authorized.
 * @remarks
 * The quota is queried on the first call by a particular user and will not be requeried until after the user record times out due to an idle time-out of activity or until a system-wide configuration period is exceeded.
 * 
 * The plug-in must call the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginauthzqueryquotacomplete">WSManPluginAuthzQueryQuotaComplete</a> function to terminate the operation whether or not the plug-in can carry out the request. If successful, the plug-in should give a set of quota information that is relevant for this particular user. If the plug-in fails to process the request for any reason,  an appropriate error should be recorded through the callback method and the error will get propagated back to the client as a Simple Object Access Protocol (SOAP) fault if possible; otherwise, the error will be an empty HTTP 500 status error.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_authorize_query_quota
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_AUTHORIZE_QUERY_QUOTA extends IUnknown {

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
