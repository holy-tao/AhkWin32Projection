#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBlockMapBlocksEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a file in the block map.
 * @remarks
 * 
 * The <b>IAppxBlockMapFile</b> interface provides a read-only object model that represents the files in the block map. Files are represented in the block map file with the <b>File</b> element. You can retrieve the file's attributes and block hashes from the <b>File</b> element. Block hashes can be obtained from the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapblock">IAppxBlockMapBlock</a> interface.
 * 
 * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
 * 
 * <div class="code"></div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapfile
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapFile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapFile
     * @type {Guid}
     */
    static IID => Guid("{277672ac-4f63-42c1-8abc-beae3600eb59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBlocks", "GetLocalFileHeaderSize", "GetName", "GetUncompressedSize", "ValidateFileHash"]

    /**
     * Retrieves an enumerator for traversing the blocks of a file listed in the block map.
     * @returns {IAppxBlockMapBlocksEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxblockmapblocksenumerator">IAppxBlockMapBlocksEnumerator</a>**</b>
     * 
     * The enumerator for traversing the blocks.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapfile-getblocks
     */
    GetBlocks() {
        result := ComCall(3, this, "ptr*", &blocks := 0, "HRESULT")
        return IAppxBlockMapBlocksEnumerator(blocks)
    }

    /**
     * Retrieves the size of the zip local file header of the associated zip file item.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a>*</b>
     * 
     * In a valid app package, <i>lfhSize</i> corresponds to the size of the zip local file header of the associated zip file item.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapfile-getlocalfileheadersize
     */
    GetLocalFileHeaderSize() {
        result := ComCall(4, this, "uint*", &lfhSize := 0, "HRESULT")
        return lfhSize
    }

    /**
     * Retrieves the name of the associated zip file item.
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * In a valid app package, <i>name</i> corresponds to the name of the associated zip file item.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapfile-getname
     */
    GetName() {
        result := ComCall(5, this, "ptr*", &name := 0, "HRESULT")
        return name
    }

    /**
     * Retrieves the uncompressed size of the associated zip file item.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>*</b>
     * 
     *  In a valid app package, <i>size</i> is the uncompressed size of the associated zip file item.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapfile-getuncompressedsize
     */
    GetUncompressedSize() {
        result := ComCall(6, this, "uint*", &size := 0, "HRESULT")
        return size
    }

    /**
     * Validates the content of a file against the hashes stored in the block elements for this block map file.
     * @param {IStream} fileStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that contains the file's contents. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>. If these methods fail, their error codes might be passed to and returned by this method.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * <b>TRUE</b> if the file hash validates; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapfile-validatefilehash
     */
    ValidateFileHash(fileStream) {
        result := ComCall(7, this, "ptr", fileStream, "int*", &isValid := 0, "HRESULT")
        return isValid
    }
}
