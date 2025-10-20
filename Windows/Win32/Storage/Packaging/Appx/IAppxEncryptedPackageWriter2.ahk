#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for encrypted app packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxencryptedpackagewriter2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxEncryptedPackageWriter2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxEncryptedPackageWriter2
     * @type {Guid}
     */
    static IID => Guid("{3e475447-3a25-40b5-8ad2-f953ae50c92d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadFilesEncrypted"]

    /**
     * 
     * @param {Integer} fileCount 
     * @param {Pointer<APPX_PACKAGE_WRITER_PAYLOAD_STREAM>} payloadFiles 
     * @param {Integer} memoryLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxencryptedpackagewriter2-addpayloadfilesencrypted
     */
    AddPayloadFilesEncrypted(fileCount, payloadFiles, memoryLimit) {
        result := ComCall(3, this, "uint", fileCount, "ptr", payloadFiles, "uint", memoryLimit, "HRESULT")
        return result
    }
}
