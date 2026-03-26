#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory4
     * @type {Guid}
     */
    static IID => Guid("{92e50000-6934-4c8d-b472-229d431daddf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageReaderFromSourceUri"]

    /**
     * 
     * @param {PWSTR} uri 
     * @param {PWSTR} expectedDigest 
     * @returns {IAppxPackageReader} 
     */
    CreatePackageReaderFromSourceUri(uri, expectedDigest) {
        uri := uri is String ? StrPtr(uri) : uri
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", uri, "ptr", expectedDigest, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }
}
