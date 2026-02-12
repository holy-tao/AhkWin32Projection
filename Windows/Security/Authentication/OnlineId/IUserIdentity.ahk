#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\OnlineIdServiceTicket.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * IUserIdentity is not supported and may be altered or unavailable in the future. Instead, use User Accounts with Fast User Switching and Remote Desktop.
 * @remarks
 * The **IUserIdentity** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IUserIdentity** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * This interface provides information that corresponds to a specific user identity present on the system. You can access this user identity's identity folder, its registry key, and its identification cookie, as well as retrieve the name associated with the user identity.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/iuseridentity
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class IUserIdentity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserIdentity
     * @type {Guid}
     */
    static IID => Guid("{2146d9cd-0742-4be3-8a1c-7c7ae679aa88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Tickets", "get_Id", "get_SafeCustomerId", "get_SignInName", "get_FirstName", "get_LastName", "get_IsBetaAccount", "get_IsConfirmedPC"]

    /**
     * @type {IVectorView<OnlineIdServiceTicket>} 
     */
    Tickets {
        get => this.get_Tickets()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    SafeCustomerId {
        get => this.get_SafeCustomerId()
    }

    /**
     * @type {HSTRING} 
     */
    SignInName {
        get => this.get_SignInName()
    }

    /**
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * @type {HSTRING} 
     */
    LastName {
        get => this.get_LastName()
    }

    /**
     * @type {Boolean} 
     */
    IsBetaAccount {
        get => this.get_IsBetaAccount()
    }

    /**
     * @type {Boolean} 
     */
    IsConfirmedPC {
        get => this.get_IsConfirmedPC()
    }

    /**
     * 
     * @returns {IVectorView<OnlineIdServiceTicket>} 
     */
    get_Tickets() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(OnlineIdServiceTicket, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
    get_SafeCustomerId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignInName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FirstName() {
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
    get_LastName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBetaAccount() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConfirmedPC() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
