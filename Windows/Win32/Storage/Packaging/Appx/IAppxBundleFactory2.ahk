#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing bundle packages, with the ability to specify the expected digest for the bundle file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxbundlefactory2
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
     * Creates a read-only bundle object that reads its contents from an IStream object, with an optional parameter for specifying the expected digest for the bundle.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream The input stream that delivers the content of the package for reading. The stream must support [ISequentialStream::Read](../objidl/nf-objidl-isequentialstream-read.md), [IStream::Seek](../objidl/nf-objidl-istream-seek.md), and [IStream::Stat](/objidl/nf-objidl-istream-stat.md). If these methods fail, their error codes may be passed to and returned by this method.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the bundle file.
     * @returns {IAppxBundleReader} The created bundle reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxbundlefactory2-createbundlereader2
     */
    CreateBundleReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &bundleReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxBundleReader(bundleReader)
    }
}
