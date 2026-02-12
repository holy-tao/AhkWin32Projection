#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxPackageWriter.ahk
#Include .\IAppxPackageReader.ahk
#Include .\IAppxManifestReader.ahk
#Include .\IAppxBlockMapReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing app packages. (IAppxFactory)
 * @remarks
 * The <b>IAppxFactory</b> interface provides factory methods to create readers and writers of app packages as well as methods to create readers for block maps and manifests outside of a package.
 * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nn-appxpackaging-iappxfactory
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
     * @remarks
     * The implementation of an <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagewriter">IAppxPackageWriter</a> is not guaranteed to write data to the output stream before the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-close">Close</a> method is called on the writer object. No other thread should access <i>outputStream</i> until the writer returns from its <b>Close</b> method.
     * @param {IStream} outputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The output stream that receives the serialized package data. The stream must support at least the  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">Write</a> method.
     * @param {Pointer<APPX_PACKAGE_SETTINGS>} settings Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ns-appxpackaging-appx_package_settings">APPX_PACKAGE_SETTINGS</a>*</b>
     * 
     * The settings for the production of this package.
     * @returns {IAppxPackageWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagewriter">IAppxPackageWriter</a>**</b>
     * 
     * The package writer created by this method.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory-createpackagewriter
     */
    CreatePackageWriter(outputStream, settings) {
        result := ComCall(3, this, "ptr", outputStream, "ptr", settings, "ptr*", &packageWriter := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxPackageWriter(packageWriter)
    }

    /**
     * Creates a read-only package reader from the contents provided by an IStream. This method does not validate the digital signature.
     * @remarks
     * The  <b>CreatePackageReader</b> method immediately retrieves footprint elements of the app package through the stream and validates their content.  This method succeeds only if the OPC package and all footprint elements (including ZIP central directory, manifest, [Content_Types].xml, and block map) are valid.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream that delivers the content of the package for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxPackageReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a>**</b>
     * 
     * A  package  reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory-createpackagereader
     */
    CreatePackageReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &packageReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxPackageReader(packageReader)
    }

    /**
     * Creates a read-only manifest object model from contents provided by an IStream.
     * @remarks
     * Use <b>CreateManifestReader</b> to read a manifest outside of an app package.  This method validates the manifest XML. The <i>manifestReader</i> provides access to all data elements and attributes in the manifest XML. The manifest logs the location of manifest validation errors in the ETW event log for AppxPackaging.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream  that delivers the manifest XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxManifestReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxmanifestreader">IAppxManifestReader</a>**</b>
     * 
     * The manifest reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory-createmanifestreader
     */
    CreateManifestReader(inputStream) {
        result := ComCall(5, this, "ptr", inputStream, "ptr*", &manifestReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxManifestReader(manifestReader)
    }

    /**
     * Creates a read-only block map object model from contents provided by an IStream.
     * @remarks
     * Use the  <b>CreateBlockMapReader</b> method to read a block map outside of an app package.  The <i>blockMapReader</i> provides access to all data elements and attributes in the block map XML.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that delivers the block map XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The block map reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader
     */
    CreateBlockMapReader(inputStream) {
        result := ComCall(6, this, "ptr", inputStream, "ptr*", &blockMapReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxBlockMapReader(blockMapReader)
    }

    /**
     * Creates a read-only block map object model from contents provided by an IStream and a digital signature.
     * @remarks
     * This method is used when the block map exists alone, outside of an app package.  The block map object provides access to all data elements and attributes in the block map XML.
     * 
     * The <i>fileName</i> parameter should include the path of a package digital signature (.p7x) file on disk.  If this parameter is not <b>NULL</b>, this method will validate the format of the signature file and validate the contents of <i>blockMapStream</i> against the signature.
     * @param {IStream} blockMapStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that delivers block map XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @param {PWSTR} signatureFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The file that contains a digital signature used to validate the contents of the input stream.
     * @returns {IAppxBlockMapReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapreader">IAppxBlockMapReader</a>**</b>
     * 
     * The block map reader.
     * @see https://learn.microsoft.com/windows/win32/api//content/appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader
     */
    CreateValidatedBlockMapReader(blockMapStream, signatureFileName) {
        signatureFileName := signatureFileName is String ? StrPtr(signatureFileName) : signatureFileName

        result := ComCall(7, this, "ptr", blockMapStream, "ptr", signatureFileName, "ptr*", &blockMapReader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAppxBlockMapReader(blockMapReader)
    }
}
