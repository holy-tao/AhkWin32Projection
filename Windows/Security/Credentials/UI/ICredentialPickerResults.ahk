#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials.UI
 * @version WindowsRuntime 1.4
 */
class ICredentialPickerResults extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialPickerResults
     * @type {Guid}
     */
    static IID => Guid("{1948f99a-cc30-410c-9c38-cc0884c5b3d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ErrorCode", "get_CredentialSaveOption", "get_CredentialSaved", "get_Credential", "get_CredentialDomainName", "get_CredentialUserName", "get_CredentialPassword"]

    /**
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * @type {Integer} 
     */
    CredentialSaveOption {
        get => this.get_CredentialSaveOption()
    }

    /**
     * @type {Boolean} 
     */
    CredentialSaved {
        get => this.get_CredentialSaved()
    }

    /**
     * @type {IBuffer} 
     */
    Credential {
        get => this.get_Credential()
    }

    /**
     * @type {HSTRING} 
     */
    CredentialDomainName {
        get => this.get_CredentialDomainName()
    }

    /**
     * @type {HSTRING} 
     */
    CredentialUserName {
        get => this.get_CredentialUserName()
    }

    /**
     * @type {HSTRING} 
     */
    CredentialPassword {
        get => this.get_CredentialPassword()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CredentialSaveOption() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CredentialSaved() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Credential() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialDomainName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialUserName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CredentialPassword() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
