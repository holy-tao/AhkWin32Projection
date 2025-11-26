#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBundleWriter.ahk
#Include .\IAppxBundleReader.ahk
#Include .\IAppxBundleManifestReader.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Creates objects for reading and writing bundle packages.
 * @remarks
 * 
 * The <b>IAppxBundleFactory</b> interface provides factory methods to create readers and writers of bundle packages as well as methods to create readers for manifests outside of a bundle. 
 * 
 * The <b>IAppxBundleFactory</b> interface is the main entry point to the Appx Bundle APIs.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlefactory
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleFactory
     * @type {Guid}
     */
    static IID => Guid("{bba65864-965f-4a5f-855f-f074bdbf3a7b}")

    /**
     * The class identifier for AppxBundleFactory
     * @type {Guid}
     */
    static CLSID => Guid("{378e0446-5384-43b7-8877-e7dbdd883446}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBundleWriter", "CreateBundleReader", "CreateBundleManifestReader"]

    /**
     * Creates a write-only bundle object to which app packages can be added.
     * @param {IStream} outputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The output stream that receives the serialized package data. The stream must support at least the  <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">Write</a> method.
     * @param {Integer} bundleVersion Type: <b>UINT64</b>
     * 
     * The version number of the bundle.
     * 
     *  If set to 0, <b>CreateBundleWriter</b> sets the version number of the bundle to a value derived from the current system time.  We recommend passing 0 so version numbers are automatically generated and each successive call generates a higher version number.
     * 
     * 
     * For example, if you call <b>CreateBundleWriter</b> on 2013/12/23 3:45:00 AM UTC with <i>bundleVersion</i> set to 0, the version number of the bundle becomes 2013.1223.0345.0000.
     * @returns {IAppxBundleWriter} Type: <b>IAppxBundleWriter**</b>
     * 
     * The bundle writer created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlewriter
     */
    CreateBundleWriter(outputStream, bundleVersion) {
        result := ComCall(3, this, "ptr", outputStream, "uint", bundleVersion, "ptr*", &bundleWriter := 0, "HRESULT")
        return IAppxBundleWriter(bundleWriter)
    }

    /**
     * Creates a read-only bundle object that reads its contents from an IStream object.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream that delivers the content of the package for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxBundleReader} Type: <b>IAppxBundleReader**</b>
     * 
     * A  bundle  reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlereader
     */
    CreateBundleReader(inputStream) {
        result := ComCall(4, this, "ptr", inputStream, "ptr*", &bundleReader := 0, "HRESULT")
        return IAppxBundleReader(bundleReader)
    }

    /**
     * Creates a read-only bundle manifest object from a standalone stream to AppxBundleManifest.xml.
     * @param {IStream} inputStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The input stream  that delivers the manifest XML for reading. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {IAppxBundleManifestReader} Type: <b>IAppxBundleManifestReader**</b>
     * 
     * The manifest reader.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlemanifestreader
     */
    CreateBundleManifestReader(inputStream) {
        result := ComCall(5, this, "ptr", inputStream, "ptr*", &manifestReader := 0, "HRESULT")
        return IAppxBundleManifestReader(manifestReader)
    }
}
