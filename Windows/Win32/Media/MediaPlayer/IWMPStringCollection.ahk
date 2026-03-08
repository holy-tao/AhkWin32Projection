#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPStringCollection interface provides methods that work with a collection of strings.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpstringcollection
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
     * The get_count method retrieves the number of items in the string collection.
     * @remarks
     * To retrieve the value of this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves the string at the given index.
     * @remarks
     * The <b>IWMPStringCollection</b> interface is used to retrieve the set of values available for an attribute. For example, the <b>IWMPMediaCollection::getAttributeStringCollection</b> method can be used to retrieve a pointer to an <b>IWMPStringCollection</b> interface representing all the values for the Genre attribute within the Audio media type. The <b>item</b> method can then be used to iterate through all of the possible values for the Genre attribute.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} lIndex <b>long</b> containing the index.
     * @param {Pointer<BSTR>} pbstrString Pointer to a <b>BSTR</b> containing the string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpstringcollection-item
     */
    item(lIndex, pbstrString) {
        result := ComCall(8, this, "int", lIndex, "ptr", pbstrString, "HRESULT")
        return result
    }
}
