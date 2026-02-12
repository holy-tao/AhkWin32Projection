#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the connect callback for a plug-in.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_connect
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_CONNECT extends IUnknown {

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
     * @param {Pointer<WSMAN_DATA>} inboundConnectInformation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(requestDetails, flags, shellContext, commandContext, inboundConnectInformation) {
        shellContextMarshal := shellContext is VarRef ? "ptr" : "ptr"
        commandContextMarshal := commandContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", requestDetails, "uint", flags, shellContextMarshal, shellContext, commandContextMarshal, commandContext, "ptr", inboundConnectInformation)
    }
}
