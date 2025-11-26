#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBlockMapFile.ahk
#Include .\IAppxBlockMapFilesEnumerator.ahk
#Include ..\..\..\System\Com\IUri.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a read-only object model for block maps that provides access to the file attributes and block hashes.
 * @remarks
 * 
 * The <b>IAppxBlockMapReader</b> represents the <b>BlockMap</b> root element of the block map. <b>File</b> elements are the child elements of the <b>BlockMap</b> element.
 * 
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createblockmapreader">CreateBlockMapReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createvalidatedblockmapreader">CreateValidatedBlockMapReader</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface, or the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagereader-getblockmap">GetBlockMap </a>method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxpackagereader">IAppxPackageReader</a> interface.
 * 
 * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
 * 
 * <div class="code"></div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapreader
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapReader
     * @type {Guid}
     */
    static IID => Guid("{5efec991-bca3-42d1-9ec2-e92d609ec22a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFile", "GetFiles", "GetHashMethod", "GetStream"]

    /**
     * Retrieves data corresponding to a file in the block map with the specified file name.
     * @param {PWSTR} filename Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the file.
     * @returns {IAppxBlockMapFile} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapfile">IAppxBlockMapFile</a>**</b>
     * 
     * The data about the file's attributes and blocks.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapreader-getfile
     */
    GetFile(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(3, this, "ptr", filename, "ptr*", &file := 0, "HRESULT")
        return IAppxBlockMapFile(file)
    }

    /**
     * Retrieves an enumerator for traversing the files listed in the block map.
     * @returns {IAppxBlockMapFilesEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapfilesenumerator">IAppxBlockMapFilesEnumerator</a>**</b>
     * 
     * The enumerator of all the files listed in the block map.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapreader-getfiles
     */
    GetFiles() {
        result := ComCall(4, this, "ptr*", &enumerator := 0, "HRESULT")
        return IAppxBlockMapFilesEnumerator(enumerator)
    }

    /**
     * Retrieves the URI for the hash algorithm used to create block hashes in the block map.
     * @returns {IUri} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775038(v=vs.85)">IUri</a>**</b>
     * 
     * The hash algorithm used in this block map.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapreader-gethashmethod
     */
    GetHashMethod() {
        result := ComCall(5, this, "ptr*", &hashMethod := 0, "HRESULT")
        return IUri(hashMethod)
    }

    /**
     * Retrieves a read-only stream that represents the XML content of the block map.
     * @returns {IStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>**</b>
     * 
     * A read-only stream that represents the XML content of the block map.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapreader-getstream
     */
    GetStream() {
        result := ComCall(6, this, "ptr*", &blockMapStream := 0, "HRESULT")
        return IStream(blockMapStream)
    }
}
