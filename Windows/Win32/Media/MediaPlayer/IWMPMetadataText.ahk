#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPMetadataText interface provides methods for retrieving information about complex textual metadata attributes.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmetadatatext
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMetadataText extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMetadataText
     * @type {Guid}
     */
    static IID => Guid("{769a72db-13d2-45e2-9c48-53ca9d5b7450}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_description", "get_text"]

    /**
     */
    description {
        get => this.get_description()
    }

    /**
     */
    text {
        get => this.get_text()
    }

    /**
     * The get_description method retrieves a description of the metadata text.
     * @param {Pointer<BSTR>} pbstrDescription Pointer to a BSTR containing the description.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmetadatatext-get_description
     */
    get_description(pbstrDescription) {
        result := ComCall(7, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * The get_text method retrieves the metadata text.
     * @param {Pointer<BSTR>} pbstrText Pointer to a <b>BSTR</b> containing the text.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmetadatatext-get_text
     */
    get_text(pbstrText) {
        result := ComCall(8, this, "ptr", pbstrText, "HRESULT")
        return result
    }
}
