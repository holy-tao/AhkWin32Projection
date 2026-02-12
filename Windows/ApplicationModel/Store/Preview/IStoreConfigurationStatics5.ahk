#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStoreConfigurationStatics5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreConfigurationStatics5
     * @type {Guid}
     */
    static IID => Guid("{f7613191-8fa9-49db-822b-0160e7e4e5c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPinToDesktopSupported", "IsPinToTaskbarSupported", "IsPinToStartSupported", "PinToDesktop", "PinToDesktopForUser"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsPinToDesktopSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsPinToTaskbarSupported() {
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
    IsPinToStartSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {HRESULT} 
     */
    PinToDesktop(appPackageFamilyName) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(9, this, "ptr", appPackageFamilyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} appPackageFamilyName 
     * @returns {HRESULT} 
     */
    PinToDesktopForUser(user_, appPackageFamilyName) {
        if(appPackageFamilyName is String) {
            pin := HSTRING.Create(appPackageFamilyName)
            appPackageFamilyName := pin.Value
        }
        appPackageFamilyName := appPackageFamilyName is Win32Handle ? NumGet(appPackageFamilyName, "ptr") : appPackageFamilyName

        result := ComCall(10, this, "ptr", user_, "ptr", appPackageFamilyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
