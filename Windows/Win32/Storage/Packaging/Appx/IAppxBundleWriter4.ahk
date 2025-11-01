#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlewriter4
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleWriter4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleWriter4
     * @type {Guid}
     */
    static IID => Guid("{9cd9d523-5009-4c01-9882-dc029fbd47a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadPackage", "AddPackageReference", "AddExternalPackageReference"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} packageStream 
     * @param {BOOL} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addpayloadpackage
     */
    AddPayloadPackage(fileName, packageStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, "int", isDefaultApplicablePackage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} inputStream 
     * @param {BOOL} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addpackagereference
     */
    AddPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "ptr", inputStream, "int", isDefaultApplicablePackage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} inputStream 
     * @param {BOOL} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter4-addexternalpackagereference
     */
    AddExternalPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(5, this, "ptr", fileName, "ptr", inputStream, "int", isDefaultApplicablePackage, "HRESULT")
        return result
    }
}
