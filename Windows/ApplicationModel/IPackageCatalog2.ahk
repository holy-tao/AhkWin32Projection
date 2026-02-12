#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\EventRegistrationToken.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\PackageCatalogAddOptionalPackageResult.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageCatalog2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageCatalog2
     * @type {Guid}
     */
    static IID => Guid("{96a60c36-8ff7-4344-b6bf-ee64c2207ed2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PackageContentGroupStaging", "remove_PackageContentGroupStaging", "AddOptionalPackageAsync"]

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageContentGroupStagingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageContentGroupStaging(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageContentGroupStaging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} optionalPackageFamilyName 
     * @returns {IAsyncOperation<PackageCatalogAddOptionalPackageResult>} 
     */
    AddOptionalPackageAsync(optionalPackageFamilyName) {
        if(optionalPackageFamilyName is String) {
            pin := HSTRING.Create(optionalPackageFamilyName)
            optionalPackageFamilyName := pin.Value
        }
        optionalPackageFamilyName := optionalPackageFamilyName is Win32Handle ? NumGet(optionalPackageFamilyName, "ptr") : optionalPackageFamilyName

        result := ComCall(8, this, "ptr", optionalPackageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PackageCatalogAddOptionalPackageResult, operation)
    }
}
