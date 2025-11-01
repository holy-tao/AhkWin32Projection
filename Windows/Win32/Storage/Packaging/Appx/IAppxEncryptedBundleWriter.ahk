#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for encrypted bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptedbundlewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptedBundleWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptedBundleWriter
     * @type {Guid}
     */
    static IID => Guid("{80b0902f-7bf0-4117-b8c6-4279ef81ee77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadPackageEncrypted", "Close"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} packageStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter-addpayloadpackageencrypted
     */
    AddPayloadPackageEncrypted(fileName, packageStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedbundlewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
