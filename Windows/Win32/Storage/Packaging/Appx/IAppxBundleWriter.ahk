#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for bundle packages.
 * @remarks
 * 
  * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlewriter">CreateBundleWriter</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxbundlefactory">IAppxBundleFactory</a> interface to retrieve the <b>IAppxBundleWriter</b> object. 
  * 
  * You can add only app packages to the writer.  The writer automatically generates footprint files, such as, the bundle’s manifest and block map.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleWriter
     * @type {Guid}
     */
    static IID => Guid("{ec446fe8-bfec-4c64-ab4f-49f038f0c6d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadPackage", "Close"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {IStream} packageStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter-addpayloadpackage
     */
    AddPayloadPackage(fileName, packageStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
