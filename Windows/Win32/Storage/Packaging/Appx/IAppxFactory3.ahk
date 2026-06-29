#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAppxAppInstallerReader.ahk" { IAppxAppInstallerReader }
#Import ".\IAppxManifestReader.ahk" { IAppxManifestReader }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IAppxPackageReader.ahk" { IAppxPackageReader }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates objects for reading and writing app packages, manifests, and app installer files.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxfactory3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxFactory3 extends IUnknown {
    /**
     * The interface identifier for IAppxFactory3
     * @type {Guid}
     */
    static IID := Guid("{776b2c05-e21d-4e24-ba1a-cd529a8bfdbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxFactory3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePackageReader2     : IntPtr
        CreateManifestReader2    : IntPtr
        CreateAppInstallerReader : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a read-only package reader from the contents provided by an IStream, with an optional parameter for specifying the expected digest for the package.
     * @remarks
     * The  **CreatePackageReader2** method immediately retrieves footprint elements of the app package through the stream and validates their content.  This method succeeds only if the OPC package and all footprint elements (including ZIP central directory, manifest, [Content_Types].xml, and block map) are valid.  
     * 
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream The input stream that delivers the package for reading. The stream must support [ISequentialStream::Read](../objidl/nf-objidl-isequentialstream-read.md), [IStream::Seek](../objidl/nf-objidl-istream-seek.md), and [IStream::Stat](/objidl/nf-objidl-istream-stat.md). If these methods fail, their error codes may be passed to and returned by this method.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the package file.
     * @returns {IAppxPackageReader} The created package reader.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createpackagereader2
     */
    CreatePackageReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(3, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &packageReader := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createmanifestreader2
     */
    CreateManifestReader2(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(4, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxManifestReader(manifestReader)
    }

    /**
     * Creates an instance of IAppInstallerReader, with an optional parameter for specifying the expected digest for the App Installer file.
     * @remarks
     * Get the digest string for the *expecteDigest* parameter by calling [IAppxDigestProvider::GetDigest](nf-appxpackaging-iappxdigestprovider-getdigest.md).
     * @param {IStream} inputStream An [IStream](../objidl/nn-objidl-istream.md) that provides the contents of an App Installer File.
     * @param {PWSTR} expectedDigest An LPCWSTR containing the expected digest, a hashed representation of the App Installer File.
     * @returns {IAppxAppInstallerReader} Receives the created **IAppInstallerReader** Instance.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxfactory3-createappinstallerreader
     */
    CreateAppInstallerReader(inputStream, expectedDigest) {
        expectedDigest := expectedDigest is String ? StrPtr(expectedDigest) : expectedDigest

        result := ComCall(5, this, "ptr", inputStream, "ptr", expectedDigest, "ptr*", &appInstallerReader := 0, "HRESULT")
        return IAppxAppInstallerReader(appInstallerReader)
    }

    Query(iid) {
        if (IAppxFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePackageReader2 := CallbackCreate(GetMethod(implObj, "CreatePackageReader2"), flags, 4)
        this.vtbl.CreateManifestReader2 := CallbackCreate(GetMethod(implObj, "CreateManifestReader2"), flags, 4)
        this.vtbl.CreateAppInstallerReader := CallbackCreate(GetMethod(implObj, "CreateAppInstallerReader"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePackageReader2)
        CallbackFree(this.vtbl.CreateManifestReader2)
        CallbackFree(this.vtbl.CreateAppInstallerReader)
    }
}
