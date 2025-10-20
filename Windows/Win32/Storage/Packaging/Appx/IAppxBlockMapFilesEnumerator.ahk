#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enumerates the files from a block map.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxblockmapfilesenumerator
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapFilesEnumerator extends IUnknown{
    /**
     * The interface identifier for IAppxBlockMapFilesEnumerator
     * @type {Guid}
     */
    static IID => Guid("{02b856a2-4262-4070-bacb-1a8cbbc42305}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxBlockMapFile>} file 
     * @returns {HRESULT} 
     */
    GetCurrent(file) {
        result := ComCall(3, this, "ptr", file, "int")
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
     * @param {Pointer<BOOL>} hasCurrent 
     * @returns {HRESULT} 
     */
    MoveNext(hasCurrent) {
        result := ComCall(5, this, "ptr", hasCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
