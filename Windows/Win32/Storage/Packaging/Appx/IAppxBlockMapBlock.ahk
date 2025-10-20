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
     * 
     * @param {Pointer<UInt32>} bufferSize 
     * @param {Pointer<Byte>} buffer 
     * @returns {HRESULT} 
     */
    GetHash(bufferSize, buffer) {
        result := ComCall(3, this, "uint*", bufferSize, "char*", buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    GetCompressedSize(size) {
        result := ComCall(4, this, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
