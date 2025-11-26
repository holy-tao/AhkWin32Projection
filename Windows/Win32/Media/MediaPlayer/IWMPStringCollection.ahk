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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "item"]

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-item
     */
    item(lIndex, pbstrString) {
        result := ComCall(8, this, "int", lIndex, "ptr", pbstrString, "HRESULT")
        return result
    }
}
