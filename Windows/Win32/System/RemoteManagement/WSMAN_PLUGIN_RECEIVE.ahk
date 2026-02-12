#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the receive callback for a plug-in.
 * @remarks
 * Based on the client request, the <b>WSMAN_PLUGIN_RECEIVE</b> callback function can be called against the shell and/or the command. The plug-in calls the <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginreceiveresult">WSManPluginReceiveResult</a> method for each piece of data that needs to be sent back to the client. After all of the data has been sent, the plug-in calls <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> to end the stream. All parameters passed in are valid until the Windows Remote Management (WinRM) plug-in calls <b>WSManPluginOperationComplete</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_receive
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_RECEIVE extends IUnknown {

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
     * @param {Pointer<WSMAN_PLUGIN_REQUEST>} requestDetails 
     * @param {Integer} flags 
     * @param {Pointer<Void>} shellContext 
     * @param {Pointer<Void>} commandContext 
     * @param {Pointer<WSMAN_STREAM_ID_SET>} streamSet 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(requestDetails, flags, shellContext, commandContext, streamSet) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", requestDetails, "uint", flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, "ptr", streamSet)
    }
}
