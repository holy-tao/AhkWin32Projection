#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IPasswordCredential extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPasswordCredential
     * @type {Guid}
     */
    static IID => Guid("{6ab18989-c720-41a7-a6c1-feadb36329a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Resource", "put_Resource", "get_UserName", "put_UserName", "get_Password", "put_Password", "RetrievePassword", "get_Properties"]

    /**
     * @type {HSTRING} 
     */
    Resource {
        get => this.get_Resource()
        set => this.put_Resource(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Resource() {
        resource := HSTRING()
        result := ComCall(6, this, "ptr", resource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return resource
    }

    /**
     * 
     * @param {HSTRING} resource 
     * @returns {HRESULT} 
     */
    put_Resource(resource) {
        if(resource is String) {
            pin := HSTRING.Create(resource)
            resource := pin.Value
        }
        resource := resource is Win32Handle ? NumGet(resource, "ptr") : resource

        result := ComCall(7, this, "ptr", resource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        userName := HSTRING()
        result := ComCall(8, this, "ptr", userName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return userName
    }

    /**
     * 
     * @param {HSTRING} userName 
     * @returns {HRESULT} 
     */
    put_UserName(userName) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName

        result := ComCall(9, this, "ptr", userName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        password := HSTRING()
        result := ComCall(10, this, "ptr", password, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return password
    }

    /**
     * 
     * @param {HSTRING} password 
     * @returns {HRESULT} 
     */
    put_Password(password) {
        if(password is String) {
            pin := HSTRING.Create(password)
            password := pin.Value
        }
        password := password is Win32Handle ? NumGet(password, "ptr") : password

        result := ComCall(11, this, "ptr", password, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RetrievePassword() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(13, this, "ptr*", &props := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(props)
    }
}
