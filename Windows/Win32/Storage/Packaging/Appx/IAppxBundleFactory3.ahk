#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleFactory3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleFactory3
     * @type {Guid}
     */
    static IID => Guid("{d11ea6b6-3909-4376-b7c4-10d50f5cf3ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBundleReaderFromSourceUri"]

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxBundleReader} 
     */
    CreateBundleReaderFromSourceUri(uri, expectedDigest) {
        uri := uri is String ? StrPtr(uri) : uri
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", uri, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }
}
