#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for app packages.
 * @remarks
 * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagewriter">CreatePackageWriter</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxpackagewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxPackageWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxPackageWriter
     * @type {Guid}
     */
    static IID => Guid("{9099e33b-246f-41e4-881a-008eb613f858}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadFile", "Close"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {PWSTR} contentType 
     * @param {Integer} compressionOption 
     * @param {IStream} inputStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-addpayloadfile
     */
    AddPayloadFile(fileName, contentType, compressionOption, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(3, this, "ptr", fileName, "ptr", contentType, "int", compressionOption, "ptr", inputStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} manifest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-close
     */
    Close(manifest) {
        result := ComCall(4, this, "ptr", manifest, "HRESULT")
        return result
    }
}
