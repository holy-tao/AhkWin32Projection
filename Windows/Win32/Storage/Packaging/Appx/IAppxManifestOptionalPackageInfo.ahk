#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the optional package information.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestoptionalpackageinfo
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestOptionalPackageInfo extends IUnknown{
    /**
     * The interface identifier for IAppxManifestOptionalPackageInfo
     * @type {Guid}
     */
    static IID => Guid("{2634847d-5b5d-4fe5-a243-002ff95edc7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} isOptionalPackage 
     * @returns {HRESULT} 
     */
    GetIsOptionalPackage(isOptionalPackage) {
        result := ComCall(3, this, "ptr", isOptionalPackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} mainPackageName 
     * @returns {HRESULT} 
     */
    GetMainPackageName(mainPackageName) {
        result := ComCall(4, this, "ptr", mainPackageName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
