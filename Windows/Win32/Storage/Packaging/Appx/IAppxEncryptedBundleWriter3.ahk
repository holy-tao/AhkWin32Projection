#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for encrypted bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptedbundlewriter3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptedBundleWriter3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptedBundleWriter3
     * @type {Guid}
     */
    static IID => Guid("{0d34deb3-5cae-4dd3-977c-504932a51d31}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadPackageEncrypted", "AddExternalPackageReference"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} packageStream 
     * @param {BOOL} isDefaultApplicablePackage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter3-addpayloadpackageencrypted
     */
    AddPayloadPackageEncrypted(fileName, packageStream, isDefaultApplicablePackage) {
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
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter3-addexternalpackagereference
     */
    AddExternalPackageReference(fileName, inputStream, isDefaultApplicablePackage) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(4, this, "ptr", fileName, "ptr", inputStream, "int", isDefaultApplicablePackage, "HRESULT")
        return result
    }
}
