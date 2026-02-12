#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxManifestReader.ahk
#Include .\IAppxAppInstallerReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages, manifests, and app installer files.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxfactory3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory3
     * @type {Guid}
     */
    static IID => Guid("{776b2c05-e21d-4e24-ba1a-cd529a8bfdbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageReader2", "CreateManifestReader2", "CreateAppInstallerReader"]

    /**
     * Creates a read-only package reader from the contents provided by an IStream, with an optional parameter for specifying the expected digest for the package.
     * @remarks
     * The  **CreatePackageReader2** method immediately retrieves footprint elements of the app package through the stream and validates their content.  This method succeeds only if the OPC package and all footprint elements (including ZIP central directory, manifest, [Content_Types].xml, and block map) are valid.  
     * 
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream The input stream that delivers the package for reading. The stream must support [ISequentialStream::Read](../objidl/nf-objidl-isequentialstream-read.md), [IStream::Seek](../objidl/nf-objidl-istream-seek.md), and [IStream::Stat](/objidl/nf-objidl-istream-stat.md). If these methods fail, their error codes may be passed to and returned by this method.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the package file.
     * @returns {IAppxPackageReader} The created package reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory3-createpackagereader2
     */
    CreatePackageReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &packageReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates a read-only manifest object model from contents provided by an IStream, with an optional parameter for specifying the expected digest for the manifest.
     * @remarks
     * Use **CreateManifestReader2** to read a manifest outside of an app package. This method validates the manifest XML. The *manifestReader* provides access to all data elements and attributes in the manifest XML. The manifest logs the location of manifest validation errors in the ETW event log for AppxPackaging.
     * 
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream The input stream  that delivers the manifest XML for reading. The stream must support [ISequentialStream::Read](../objidl/nf-objidl-isequentialstream-read.md), [IStream::Seek](../objidl/nf-objidl-istream-seek.md), and [IStream::Stat](/objidl/nf-objidl-istream-stat.md). If these methods fail, their error codes may be passed to and returned by this method.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the manifest file.
     * @returns {IAppxManifestReader} The created manifest reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory3-createmanifestreader2
     */
    CreateManifestReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &manifestReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxManifestReader(manifestReader)
    }

    /**
     * Creates an instance of IAppInstallerReader, with an optional parameter for specifying the expected digest for the App Installer file.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream An [IStream](../objidl/nn-objidl-istream.md) that provides the contents of an App Installer File.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the App Installer File.
     * @returns {IAppxAppInstallerReader} Receives the created **IAppInstallerReader** Instance.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory3-createappinstallerreader
     */
    CreateAppInstallerReader(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(5, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &appInstallerReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxAppInstallerReader(appInstallerReader)
    }
}
