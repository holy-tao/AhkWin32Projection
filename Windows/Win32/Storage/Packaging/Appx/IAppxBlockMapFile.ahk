#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IAppxBlockMapBlocksEnumerator>} blocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfile-getblocks
     */
    GetBlocks(blocks) {
        result := ComCall(3, this, "ptr*", blocks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lfhSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfile-getlocalfileheadersize
     */
    GetLocalFileHeaderSize(lfhSize) {
        result := ComCall(4, this, "uint*", lfhSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfile-getname
     */
    GetName(name) {
        result := ComCall(5, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfile-getuncompressedsize
     */
    GetUncompressedSize(size) {
        result := ComCall(6, this, "uint*", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} fileStream 
     * @param {Pointer<BOOL>} isValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapfile-validatefilehash
     */
    ValidateFileHash(fileStream, isValid) {
        result := ComCall(7, this, "ptr", fileStream, "ptr", isValid, "HRESULT")
        return result
    }
}
