#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXREGISTERROUTINGEXTENSIONW extends IUnknown {

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
     * @param {PWSTR} ExtensionName 
     * @param {PWSTR} FriendlyName 
     * @param {PWSTR} ImageName 
     * @param {Pointer<PFAX_ROUTING_INSTALLATION_CALLBACKW>} CallBack 
     * @param {Pointer<Void>} Context_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, ExtensionName, FriendlyName, ImageName, CallBack, Context_) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        ExtensionName := ExtensionName is String ? StrPtr(ExtensionName) : ExtensionName
        FriendlyName := FriendlyName is String ? StrPtr(FriendlyName) : FriendlyName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FaxHandle, "ptr", ExtensionName, "ptr", FriendlyName, "ptr", ImageName, "ptr", CallBack, Context_Marshal, Context_, "int")
        return result
    }
}
