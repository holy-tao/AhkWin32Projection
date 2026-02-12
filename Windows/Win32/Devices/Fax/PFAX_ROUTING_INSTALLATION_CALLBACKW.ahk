#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxRoutingInstallationCallback function is a library-defined callback function that the FaxRegisterRoutingExtension function calls to install a fax routing extension DLL.
 * @remarks
 * The <b>PFAX_ROUTING_INSTALLATION_CALLBACKW</b> data type is a pointer to a <i>FaxRoutingInstallationCallback</i> function.
 * 
 * A fax client application specifies the <i>FaxRoutingInstallationCallback</i> function by passing its address when it calls the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/nf-winfax-faxregisterroutingextensionw">FaxRegisterRoutingExtension</a> function. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-registration-of-a-fax-routing-extension">Registration of a Fax Routing Extension</a>.
 * 
 * For information about fax routing extensions, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-about-the-fax-routing-extension-api">About the Fax Routing Extension API</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfax_routing_installation_callbackw
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAX_ROUTING_INSTALLATION_CALLBACKW extends IUnknown {

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
     * @param {HANDLE} FaxHandle 
     * @param {Pointer<Void>} Context_ 
     * @param {PWSTR} MethodName 
     * @param {PWSTR} FriendlyName 
     * @param {PWSTR} FunctionName 
     * @param {PWSTR} Guid 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, Context_, MethodName, FriendlyName, FunctionName, Guid) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        MethodName := MethodName is String ? StrPtr(MethodName) : MethodName
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        FunctionName := FunctionName is String ? StrPtr(FunctionName) : FunctionName
        Guid := Guid is String ? StrPtr(Guid) : Guid

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FaxHandle, Context_Marshal, Context_, "ptr", MethodName, "ptr", FriendlyName, "ptr", FunctionName, "ptr", Guid, "int")
        return result
    }
}
