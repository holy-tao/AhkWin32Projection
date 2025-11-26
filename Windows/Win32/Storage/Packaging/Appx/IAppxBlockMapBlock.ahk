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
     * Retrieves the hash value of the block.
     * @param {Pointer<Integer>} bufferSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a>*</b>
     * 
     * The length of  <i>buffer</i>.
     * @returns {Pointer<Integer>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * The byte sequence representing the hash value of the block.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapblock-gethash
     */
    GetHash(bufferSize) {
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, bufferSizeMarshal, bufferSize, "ptr*", &buffer := 0, "HRESULT")
        return buffer
    }

    /**
     * Retrieves compressed size of the block.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a>*</b>
     * 
     * The compressed size of the block, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxblockmapblock-getcompressedsize
     */
    GetCompressedSize() {
        result := ComCall(4, this, "uint*", &size := 0, "HRESULT")
        return size
    }
}
