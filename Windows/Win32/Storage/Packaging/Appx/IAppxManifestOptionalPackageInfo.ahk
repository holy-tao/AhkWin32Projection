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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIsOptionalPackage", "GetMainPackageName"]

    /**
     * Determines whether the package is optional.
     * @returns {BOOL} True if the package is optional, false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestoptionalpackageinfo-getisoptionalpackage
     */
    GetIsOptionalPackage() {
        result := ComCall(3, this, "int*", &isOptionalPackage := 0, "HRESULT")
        return isOptionalPackage
    }

    /**
     * Gets the main package name from the optional package.
     * @returns {PWSTR} The main package name.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestoptionalpackageinfo-getmainpackagename
     */
    GetMainPackageName() {
        result := ComCall(4, this, "ptr*", &mainPackageName := 0, "HRESULT")
        return mainPackageName
    }
}
