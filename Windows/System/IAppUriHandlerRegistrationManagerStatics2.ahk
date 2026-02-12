#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppUriHandlerRegistrationManager.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppUriHandlerRegistrationManagerStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppUriHandlerRegistrationManagerStatics2
     * @type {Guid}
     */
    static IID => Guid("{14f78379-6890-5080-90a7-98824a7f079e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForPackage", "GetForPackageForUser"]

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {AppUriHandlerRegistrationManager} 
     */
    GetForPackage(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(6, this, "ptr", packageFamilyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppUriHandlerRegistrationManager(result_)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {User} user_ 
     * @returns {AppUriHandlerRegistrationManager} 
     */
    GetForPackageForUser(packageFamilyName, user_) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(7, this, "ptr", packageFamilyName, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppUriHandlerRegistrationManager(result_)
    }
}
