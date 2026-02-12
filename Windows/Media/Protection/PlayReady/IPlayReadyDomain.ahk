#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to metadata about a domain to which the current system is a member.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyDomain extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyDomain
     * @type {Guid}
     */
    static IID => Guid("{adcc93ac-97e6-43ef-95e4-d7868f3b16a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccountId", "get_ServiceId", "get_Revision", "get_FriendlyName", "get_DomainJoinUrl"]

    /**
     * Gets the current domain account identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain.accountid
     * @type {Guid} 
     */
    AccountId {
        get => this.get_AccountId()
    }

    /**
     * Gets the current domain service identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain.serviceid
     * @type {Guid} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the current domain revision number.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain.revision
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
    }

    /**
     * Gets the current domain friendly name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets the URL used to join the domain.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.iplayreadydomain.domainjoinurl
     * @type {Uri} 
     */
    DomainJoinUrl {
        get => this.get_DomainJoinUrl()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AccountId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ServiceId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_DomainJoinUrl() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }
}
