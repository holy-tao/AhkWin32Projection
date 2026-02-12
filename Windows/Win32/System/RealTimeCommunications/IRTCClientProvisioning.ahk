#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCProfile.ahk
#Include .\IRTCEnumProfiles.ahk
#Include .\IRTCCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCClientProvisioning extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCClientProvisioning
     * @type {Guid}
     */
    static IID => Guid("{b9f5cf06-65b9-4a80-a0e6-73cae3ef3822}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProfile", "EnableProfile", "DisableProfile", "EnumerateProfiles", "get_Profiles", "GetProfile", "get_SessionCapabilities"]

    /**
     * @type {IRTCCollection} 
     */
    Profiles {
        get => this.get_Profiles()
    }

    /**
     * @type {Integer} 
     */
    SessionCapabilities {
        get => this.get_SessionCapabilities()
    }

    /**
     * Creates a new user profile.
     * @remarks
     * The caller must have administrator privileges to call this function.
     * @param {BSTR} bstrProfileXML 
     * @returns {IRTCProfile} 
     * @see https://learn.microsoft.com/windows/win32/api//content/userenv/nf-userenv-createprofile
     */
    CreateProfile(bstrProfileXML) {
        if(bstrProfileXML is String) {
            pin := BSTR.Alloc(bstrProfileXML)
            bstrProfileXML := pin.Value
        }

        result := ComCall(3, this, "ptr", bstrProfileXML, "ptr*", &ppProfile := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @param {Integer} lRegisterFlags 
     * @returns {HRESULT} 
     */
    EnableProfile(pProfile, lRegisterFlags) {
        result := ComCall(4, this, "ptr", pProfile, "int", lRegisterFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IRTCProfile} pProfile 
     * @returns {HRESULT} 
     */
    DisableProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRTCEnumProfiles} 
     */
    EnumerateProfiles() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCEnumProfiles(ppEnum)
    }

    /**
     * 
     * @returns {IRTCCollection} 
     */
    get_Profiles() {
        result := ComCall(7, this, "ptr*", &ppCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRTCCollection(ppCollection)
    }

    /**
     * Retrieves an integer from a key in the specified section of the Win.ini file. (Unicode)
     * @remarks
     * If the key name consists of digits followed by characters that are not numeric, the function returns only the value of the digits. For example, the function returns 102 for the following line: KeyName=102abc.
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>Calls to profile functions may be mapped to the registry instead of to the initialization files. This mapping occurs when the initialization file and section are specified in the registry under the following key:<b>HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\IniFileMapping</b>
     * 
     * When the operation has been mapped, the 
     * <b>GetProfileInt</b> function retrieves information from the registry, not from the initialization file; the change in the storage location has no effect on the function's behavior.
     * 
     * The profile functions use the following steps to locate initialization information:
     * 				
     * 			
     * 
     * <ol>
     * <li>Look in the registry for the name of the initialization file  under the <b>IniFileMapping</b> key.</li>
     * <li>Look for the section name specified by <i>lpAppName</i>. This will be a named value under the key that has the name of the initialization file, or a subkey with this name, or the name will not exist as either a value or subkey.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a named value, then that value specifies where in the registry you will find the keys for the section.</li>
     * <li>If the section name specified by <i>lpAppName</i> is a subkey, then named values under that subkey specify where in the registry you will find the keys for the section. If the key you are looking for does not exist as a named value, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the key.</li>
     * <li>If the section name specified by <i>lpAppName</i> does not exist as a named value or as a subkey, then there will be an unnamed value (shown as <b>&lt;No Name&gt;</b>) that specifies the default location in the registry where you will find the keys for the section.</li>
     * <li>If there is no subkey or entry for the section name, then look for the actual initialization file on the disk and read its contents.</li>
     * </ol>
     * When looking at values in the registry that specify other registry locations, there are several prefixes that change the behavior of the .ini file mapping:
     * 				
     * 			
     * 
     * <ul>
     * <li>! - this character forces all writes to go both to the registry and to the .ini file on disk.</li>
     * <li># - this character causes the registry value to be set to the value in the Windows 3.1 .ini file when a new user logs in for the first time after setup.</li>
     * <li>@ - this character prevents any reads from going to the .ini file on disk if the requested data is not found in the registry.</li>
     * <li>USR: - this prefix stands for <b>HKEY_CURRENT_USER</b>, and the text after the prefix is relative to that key.</li>
     * <li>SYS: - this prefix stands for <b>HKEY_LOCAL_MACHINE\SOFTWARE</b>, and the text after the prefix is relative to that key.</li>
     * </ul>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetProfileInt as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BSTR} bstrUserAccount 
     * @param {BSTR} bstrUserPassword 
     * @param {BSTR} bstrUserURI 
     * @param {BSTR} bstrServer 
     * @param {Integer} lTransport 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} The return value is the integer equivalent of the string following the key name in Win.ini. If the function cannot find the key, the return value is the default value. If the value of the key is less than zero, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getprofileintw
     */
    GetProfile(bstrUserAccount, bstrUserPassword, bstrUserURI, bstrServer, lTransport, lCookie) {
        if(bstrUserAccount is String) {
            pin := BSTR.Alloc(bstrUserAccount)
            bstrUserAccount := pin.Value
        }
        if(bstrUserPassword is String) {
            pin := BSTR.Alloc(bstrUserPassword)
            bstrUserPassword := pin.Value
        }
        if(bstrUserURI is String) {
            pin := BSTR.Alloc(bstrUserURI)
            bstrUserURI := pin.Value
        }
        if(bstrServer is String) {
            pin := BSTR.Alloc(bstrServer)
            bstrServer := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrUserAccount, "ptr", bstrUserPassword, "ptr", bstrUserURI, "ptr", bstrServer, "int", lTransport, "ptr", lCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionCapabilities() {
        result := ComCall(9, this, "int*", &plSupportedSessions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plSupportedSessions
    }
}
