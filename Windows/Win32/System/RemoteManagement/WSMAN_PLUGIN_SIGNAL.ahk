#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the signal callback for a plug-in.
 * @remarks
 * A signal can be received for processing a CTRL+C sequence or one of many other types of custom signals. The 
 *     callback is called once for each signal that is received. The plug-in determines which signals cause commands 
 *     and/or shells to be shut down. Because signals are shell-specific, the plug-in must initiate the shutdown by 
 *     calling the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/wsman/nf-wsman-wsmanpluginoperationcomplete">WSManPluginOperationComplete</a> method. For 
 *     each call, the plug-in should call 
 *     <b>WSManPluginOperationComplete</b> to 
 *     acknowledge receipt and to allow the next signal to be received.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_signal
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_SIGNAL extends IUnknown {

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
     * @param {PWSTR} code 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(requestDetails, flags, shellContext, commandContext, code) {
        code := code is String ? StrPtr(code) : code

        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", requestDetails, "uint", flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, "ptr", code)
    }
}
