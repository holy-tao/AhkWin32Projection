#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPLibrary.ahk

/**
 * The IWMPLibrary2 interface represents a media library.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibrary2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibrary2 extends IWMPLibrary{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPLibrary2
     * @type {Guid}
     */
    static IID => Guid("{dd578a4e-79b1-426c-bf8f-3add9072500b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getItemInfo"]

    /**
     * The getItemInfo method retrieves the value of the LibraryID attribute.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the attribute name. Set the value of this parameter to "LibraryID".
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> that receives the value of the <b>LibraryID</b> attribute.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrary2-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(7, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }
}
