#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines the startup callback for the plug-in.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsman/nc-wsman-wsman_plugin_startup
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_PLUGIN_STARTUP extends IUnknown {

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
     * @param {Integer} flags 
     * @param {PWSTR} applicationIdentification 
     * @param {PWSTR} extraInfo 
     * @param {Pointer<Pointer<Void>>} pluginContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(flags, applicationIdentification, extraInfo, pluginContext) {
        applicationIdentification := applicationIdentification is String ? StrPtr(applicationIdentification) : applicationIdentification
        extraInfo := extraInfo is String ? StrPtr(extraInfo) : extraInfo

        pluginContextMarshal := pluginContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", flags, "ptr", applicationIdentification, "ptr", extraInfo, pluginContextMarshal, pluginContext, "uint")
        return result
    }
}
