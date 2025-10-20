#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleFactory2 extends IUnknown{
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
     * 
     * @param {Pointer<IStream>} inputStream 
     * @param {PWSTR} expectedDigest 
     * @param {Pointer<IAppxBundleReader>} bundleReader 
     * @returns {HRESULT} 
     */
    CreateBundleReader2(inputStream, expectedDigest, bundleReader) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr", bundleReader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
