#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IAppxBlockMapBlock interface provides a read-only object that represents an individual block within a file contained in the block map file (AppxBlockMap.xml) for the App package.
 * @remarks
 * 
  * Each <b>Block</b> element has an attribute for the hash value and compressed size of the block.
  * 
  * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
  * 
  * <div class="code"></div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapblock
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapBlock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapBlock
     * @type {Guid}
     */
    static IID => Guid("{75cf3930-3244-4fe0-a8c8-e0bcb270b889}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHash", "GetCompressedSize"]

    /**
     * 
     * @param {Pointer<Integer>} bufferSize 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapblock-gethash
     */
    GetHash(bufferSize, buffer) {
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, bufferSizeMarshal, bufferSize, bufferMarshal, buffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapblock-getcompressedsize
     */
    GetCompressedSize(size) {
        sizeMarshal := size is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, sizeMarshal, size, "HRESULT")
        return result
    }
}
