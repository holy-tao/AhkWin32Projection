#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPMediaCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibrary interface represents a library.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibrary
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPLibrary
     * @type {Guid}
     */
    static IID => Guid("{3df47861-7df1-4c1f-a81b-4c26f0f7a7c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_name", "get_type", "get_mediaCollection", "isIdentical"]

    /**
     */
    name {
        get => this.get_name()
    }

    /**
     */
    type {
        get => this.get_type()
    }

    /**
     * @type {IWMPMediaCollection} 
     */
    mediaCollection {
        get => this.get_mediaCollection()
    }

    /**
     * The get_name method retrieves the display name of the current library.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the name of the current library.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrary-get_name
     */
    get_name(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The get_type method retrieves a value that indicates the library type.
     * @param {Pointer<Integer>} pwmplt Pointer to a variable that receives a value from the <b>WMPLibraryType</b> enumeration that indicates the library type.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrary-get_type
     */
    get_type(pwmplt) {
        pwmpltMarshal := pwmplt is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pwmpltMarshal, pwmplt, "HRESULT")
        return result
    }

    /**
     * The get_mediaCollection method retrieves a pointer to the IWMPMediaCollection interface for the current library.
     * @returns {IWMPMediaCollection} Address of a variable that receives a pointer to the <b>IWMPMediaCollection</b> interface for the current library.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrary-get_mediacollection
     */
    get_mediaCollection() {
        result := ComCall(5, this, "ptr*", &ppIWMPMediaCollection := 0, "HRESULT")
        return IWMPMediaCollection(ppIWMPMediaCollection)
    }

    /**
     * The isIdentical method retrieves a value that indicates whether the supplied object is the same as the current one.
     * @param {IWMPLibrary} pIWMPLibrary Pointer to an <b>IWMPLibrary</b> interface that represents the object to compare with current one.
     * @param {Pointer<VARIANT_BOOL>} pvbool Pointer to a <b>VARIANT_BOOL</b> that receives the result of the comparison. VARIANT_TRUE indicates that the objects are the same.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrary-isidentical
     */
    isIdentical(pIWMPLibrary, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(6, this, "ptr", pIWMPLibrary, pvboolMarshal, pvbool, "HRESULT")
        return result
    }
}
