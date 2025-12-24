#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageWriter.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxManifestReader.ahk
#Include .\IAppxBlockMapReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages.
 * @remarks
 * 
 * The <b>IAppxFactory</b> interface provides factory methods to create readers and writers of app packages as well as methods to create readers for block maps and manifests outside of a package.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxfactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFactory
     * @type {Guid}
     */
    static IID => Guid("{beb94909-e451-438b-b5a7-d79e767b75d8}")

    /**
     * The class identifier for AppxFactory
     * @type {Guid}
     */
    static CLSID => Guid("{5842a140-ff9f-4166-8f5c-62f5b7b0c781}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePackageWriter", "CreatePackageReader", "CreateManifestReader", "CreateBlockMapReader", "CreateValidatedBlockMapReader"]

    /**
     * Creates a write-only package object to which files can be added.
     * @param {IStream} outputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The output stream that receives the serialized package data. The stream must support at least the  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">Write</a> method.
     * @param {Pointer<APPX_PACKAGE_SETTINGS>} settings Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ns-appxpackaging-appx_package_settings">APPX_PACKAGE_SETTINGS</a>*</b>
     * 
     * The settings for the production of this package.
     * @returns {IAppxPackageWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagewriter">IAppxPackageWriter</a>**</b>
     * 
     * The package writer created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory-createpackagewriter
     */
    CreatePackageWriter(outputStream, settings) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", settings, "ptr*", &packageWriter := 0, "HRESULT")
        return IAppxPackageWriter(packageWriter)
    }

    /**
     * Creates a read-only package reader from the contents provided by an IStream. This method does not validate the digital signature.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream that delivers the content of the package for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxPackageReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a>**</b>
     * 
     * A  package  reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader
     */
    CreatePackageReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &packageReader := 0, "HRESULT")
        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates a read-only manifest object model from contents provided by an IStream.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream  that delivers the manifest XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxManifestReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a>**</b>
     * 
     * The manifest reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory-createmanifestreader
     */
    CreateManifestReader(inputStream) {
        result := ComCall(5, this, "ptr", inputStream, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxManifestReader(manifestReader)
    }

    /**
     * Creates a read-only block map object model from contents provided by an IStream.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that delivers the block map XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The block map reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader
     */
    CreateBlockMapReader(inputStream) {
        result := ComCall(6, this, "ptr", inputStream, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * Creates a read-only block map object model from contents provided by an IStream and a digital signature.
     * @param {IStream} blockMapStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that delivers block map XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @param {PWSTR} signatureFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The file that contains a digital signature used to validate the contents of the input stream.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The block map reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader
     */
    CreateValidatedBlockMapReader(blockMapStream, signatureFileName) {
        signatureFileName := signatureFileName is String ? StrPtr(signatureFileName) : signatureFileName

        result := ComCall(7, this, "ptr", blockMapStream, "ptr", signatureFileName, "ptr*", &blockMapReader := 0, "HRESULT")
        return IAppxBlockMapReader(blockMapReader)
    }
}
