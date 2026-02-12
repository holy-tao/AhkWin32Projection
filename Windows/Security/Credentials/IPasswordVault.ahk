#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PasswordCredential.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IPasswordVault extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPasswordVault
     * @type {Guid}
     */
    static IID => Guid("{61fd2c0b-c8d4-48c1-a54f-bc5a64205af2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "Retrieve", "FindAllByResource", "FindAllByUserName", "RetrieveAll"]

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(credential) {
        result := ComCall(6, this, "ptr", credential, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(credential) {
        result := ComCall(7, this, "ptr", credential, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieve Rows Using Bookmarks (Native Client OLE DB provider)
     * @param {HSTRING} resource 
     * @param {HSTRING} userName 
     * @returns {PasswordCredential} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/native-client-ole-db-how-to/retrieve-rows-using-bookmarks-ole-db
     */
    Retrieve(resource, userName) {
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

        result := ComCall(8, this, "ptr", resource, "ptr", userName, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(credential)
    }

    /**
     * 
     * @param {HSTRING} resource 
     * @returns {IVectorView<PasswordCredential>} 
     */
    FindAllByResource(resource) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource

        result := ComCall(9, this, "ptr", resource, "ptr*", &credentials := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PasswordCredential, credentials)
    }

    /**
     * 
     * @param {HSTRING} userName 
     * @returns {IVectorView<PasswordCredential>} 
     */
    FindAllByUserName(userName) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName

        result := ComCall(10, this, "ptr", userName, "ptr*", &credentials := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PasswordCredential, credentials)
    }

    /**
     * 
     * @returns {IVectorView<PasswordCredential>} 
     */
    RetrieveAll() {
        result := ComCall(11, this, "ptr*", &credentials := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PasswordCredential, credentials)
    }
}
