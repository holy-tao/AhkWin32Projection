#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that's invoked by the account settings pane when the user deletes a credential.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.credentialcommandcredentialdeletedhandler
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class CredentialCommandCredentialDeletedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for CredentialCommandCredentialDeletedHandler
     * @type {Guid}
     */
    static IID => Guid("{61c0e185-0977-4678-b4e2-98727afbeed9}")

    /**
     * The class identifier for CredentialCommandCredentialDeletedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{61c0e185-0977-4678-b4e2-98727afbeed9}")

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
     * @param {CredentialCommand} command 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(command) {
        result := ComCall(3, this, "ptr", command, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
