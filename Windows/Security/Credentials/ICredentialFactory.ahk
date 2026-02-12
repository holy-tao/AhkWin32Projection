#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PasswordCredential.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class ICredentialFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialFactory
     * @type {Guid}
     */
    static IID => Guid("{54ef13a1-bf26-47b5-97dd-de779b7cad58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePasswordCredential"]

    /**
     * 
     * @param {HSTRING} resource 
     * @param {HSTRING} userName 
     * @param {HSTRING} password 
     * @returns {PasswordCredential} 
     */
    CreatePasswordCredential(resource, userName, password) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(6, this, "ptr", resource, "ptr", userName, "ptr", password, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(credential)
    }
}
