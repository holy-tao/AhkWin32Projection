#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPStringCollection interface provides methods that work with a collection of strings.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpstringcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPStringCollection extends IDispatch{
    /**
     * The interface identifier for IWMPStringCollection
     * @type {Guid}
     */
    static IID => Guid("{4a976298-8c0d-11d3-b389-00c04f68574b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(7, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrString 
     * @returns {HRESULT} 
     */
    item(lIndex, pbstrString) {
        result := ComCall(8, this, "int", lIndex, "ptr", pbstrString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
