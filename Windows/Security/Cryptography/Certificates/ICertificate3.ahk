#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificate3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificate3
     * @type {Guid}
     */
    static IID => Guid("{be51a966-ae5f-4652-ace7-c6d7e7724cf3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPerUser", "get_StoreName", "get_KeyStorageProviderName"]

    /**
     * @type {Boolean} 
     */
    IsPerUser {
        get => this.get_IsPerUser()
    }

    /**
     * @type {HSTRING} 
     */
    StoreName {
        get => this.get_StoreName()
    }

    /**
     * @type {HSTRING} 
     */
    KeyStorageProviderName {
        get => this.get_KeyStorageProviderName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPerUser() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyStorageProviderName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
