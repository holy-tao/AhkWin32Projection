#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlefactory2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleFactory2
     * @type {Guid}
     */
    static IID => Guid("{7325b83d-0185-42c4-82ac-be34ab1a2a8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBundleReader2"]

    /**
     * 
     * @param {IStream} inputStream 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxBundleReader} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlefactory2-createbundlereader2
     */
    CreateBundleReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }
}
