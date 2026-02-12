#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IPackageManager12 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageManager12
     * @type {Guid}
     */
    static IID => Guid("{5d233adf-f9e3-4d96-b40d-96788e39539f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPackageRemovalPending", "IsPackageRemovalPendingForUser", "IsPackageRemovalPendingByUri", "IsPackageRemovalPendingByUriForUser"]

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @returns {Boolean} 
     */
    IsPackageRemovalPending(packageFullName) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName

        result := ComCall(6, this, "ptr", packageFullName, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} packageFullName 
     * @param {HSTRING} userSecurityId 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingForUser(packageFullName, userSecurityId) {
        if(packageFullName is String) {
            pin := HSTRING.Create(packageFullName)
            packageFullName := pin.Value
        }
        packageFullName := packageFullName is Win32Handle ? NumGet(packageFullName, "ptr") : packageFullName
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(7, this, "ptr", packageFullName, "ptr", userSecurityId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingByUri(packageUri) {
        result := ComCall(8, this, "ptr", packageUri, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Uri} packageUri 
     * @param {HSTRING} userSecurityId 
     * @returns {Boolean} 
     */
    IsPackageRemovalPendingByUriForUser(packageUri, userSecurityId) {
        if(userSecurityId is String) {
            pin := HSTRING.Create(userSecurityId)
            userSecurityId := pin.Value
        }
        userSecurityId := userSecurityId is Win32Handle ? NumGet(userSecurityId, "ptr") : userSecurityId

        result := ComCall(9, this, "ptr", packageUri, "ptr", userSecurityId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
