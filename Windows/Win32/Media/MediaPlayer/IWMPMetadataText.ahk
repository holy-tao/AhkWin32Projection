#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPMetadataText interface provides methods for retrieving information about complex textual metadata attributes.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmetadatatext
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPMetadataText extends IDispatch {
    /**
     * The interface identifier for IWMPMetadataText
     * @type {Guid}
     */
    static IID := Guid("{769a72db-13d2-45e2-9c48-53ca9d5b7450}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPMetadataText interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_description : IntPtr
        get_text        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPMetadataText.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatatext-get_description
     */
    get_description(pbstrDescription) {
        result := ComCall(7, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return result
    }

    /**
     * The get_text method retrieves the metadata text.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatatext-get_text
     */
    get_text(pbstrText) {
        result := ComCall(8, this, BSTR.Ptr, pbstrText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPMetadataText.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_description := CallbackCreate(GetMethod(implObj, "get_description"), flags, 2)
        this.vtbl.get_text := CallbackCreate(GetMethod(implObj, "get_text"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_description)
        CallbackFree(this.vtbl.get_text)
    }
}
