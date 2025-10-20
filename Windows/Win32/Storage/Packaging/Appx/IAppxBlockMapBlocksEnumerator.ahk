#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the blocks from a block map in a single file.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapblocksenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapBlocksEnumerator extends IUnknown{
    /**
     * The interface identifier for IAppxBlockMapBlocksEnumerator
     * @type {Guid}
     */
    static IID => Guid("{6b429b5b-36ef-479e-b9eb-0c1482b49e16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxBlockMapBlock>} block 
     * @returns {HRESULT} 
     */
    GetCurrent(block) {
        result := ComCall(3, this, "ptr", block, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     */
    GetHasCurrent(hasCurrent) {
        result := ComCall(4, this, "ptr", hasCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     */
    MoveNext(hasNext) {
        result := ComCall(5, this, "ptr", hasNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
