#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for encrypted app packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptedpackagewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptedPackageWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptedPackageWriter
     * @type {Guid}
     */
    static IID => Guid("{f43d0b0b-1379-40e2-9b29-682ea2bf42af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadFileEncrypted", "Close"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Integer} compressionOption 
     * @param {IStream} inputStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter-addpayloadfileencrypted
     */
    AddPayloadFileEncrypted(fileName, compressionOption, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "int", compressionOption, "ptr", inputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
