#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SharedPackageContainerManager.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class ISharedPackageContainerManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedPackageContainerManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{2ef56348-838a-5f55-a89e-1198a2c627e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefault", "GetForUser", "GetForProvisioning"]

    /**
     * Retrieves the default configuration for the specified communications device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GetDefaultCommConfig as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {SharedPackageContainerManager} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-getdefaultcommconfigw
     */
    GetDefault() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SharedPackageContainerManager(result_)
    }

    /**
     * 
     * @param {HSTRING} userSid 
     * @returns {SharedPackageContainerManager} 
     */
    GetForUser(userSid) {
        if(userSid is String) {
            pin := HSTRING.Create(userSid)
            userSid := pin.Value
        }
        userSid := userSid is Win32Handle ? NumGet(userSid, "ptr") : userSid

        result := ComCall(7, this, "ptr", userSid, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SharedPackageContainerManager(result_)
    }

    /**
     * 
     * @returns {SharedPackageContainerManager} 
     */
    GetForProvisioning() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SharedPackageContainerManager(result_)
    }
}
