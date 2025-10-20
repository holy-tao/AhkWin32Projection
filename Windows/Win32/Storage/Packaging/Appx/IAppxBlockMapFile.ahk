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
     * 
     * @param {Pointer<IAppxBlockMapBlocksEnumerator>} blocks 
     * @returns {HRESULT} 
     */
    GetBlocks(blocks) {
        result := ComCall(3, this, "ptr", blocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lfhSize 
     * @returns {HRESULT} 
     */
    GetLocalFileHeaderSize(lfhSize) {
        result := ComCall(4, this, "uint*", lfhSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} name 
     * @returns {HRESULT} 
     */
    GetName(name) {
        result := ComCall(5, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} size 
     * @returns {HRESULT} 
     */
    GetUncompressedSize(size) {
        result := ComCall(6, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} fileStream 
     * @param {Pointer<BOOL>} isValid 
     * @returns {HRESULT} 
     */
    ValidateFileHash(fileStream, isValid) {
        result := ComCall(7, this, "ptr", fileStream, "ptr", isValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
