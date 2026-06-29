#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPMetadataPicture interface provides methods for retrieving information about the WM/Picture metadata attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmetadatapicture
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPMetadataPicture extends IDispatch {
    /**
     * The interface identifier for IWMPMetadataPicture
     * @type {Guid}
     */
    static IID := Guid("{5c29bbe0-f87d-4c45-aa28-a70f0230ffa9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPMetadataPicture interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_mimeType    : IntPtr
        get_pictureType : IntPtr
        get_description : IntPtr
        get_URL         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPMetadataPicture.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    mimeType {
        get => this.get_mimeType()
    }

    /**
     */
    pictureType {
        get => this.get_pictureType()
    }

    /**
     */
    description {
        get => this.get_description()
    }

    /**
     */
    URL {
        get => this.get_URL()
    }

    /**
     * The get_mimeType method retrieves a pointer to a string specifying the MIME type of the metadata image.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<BSTR>} pbstrMimeType Pointer to a <b>BSTR</b> containing the mime type.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_mimetype
     */
    get_mimeType(pbstrMimeType) {
        result := ComCall(7, this, BSTR.Ptr, pbstrMimeType, "HRESULT")
        return result
    }

    /**
     * The get_pictureType method retrieves a pointer to a string specifying the picture type of the metadata image.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<BSTR>} pbstrPictureType Pointer to a <b>BSTR</b> containing the picture type.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_picturetype
     */
    get_pictureType(pbstrPictureType) {
        result := ComCall(8, this, BSTR.Ptr, pbstrPictureType, "HRESULT")
        return result
    }

    /**
     * The get_description method retrieves a pointer to the description of the metadata image.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<BSTR>} pbstrDescription Pointer to a <b>BSTR</b> containing the description.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_description
     */
    get_description(pbstrDescription) {
        result := ComCall(9, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return result
    }

    /**
     * This method is for internal use only.
     * @param {Pointer<BSTR>} pbstrURL 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmetadatapicture-get_url
     */
    get_URL(pbstrURL) {
        result := ComCall(10, this, BSTR.Ptr, pbstrURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPMetadataPicture.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_mimeType := CallbackCreate(GetMethod(implObj, "get_mimeType"), flags, 2)
        this.vtbl.get_pictureType := CallbackCreate(GetMethod(implObj, "get_pictureType"), flags, 2)
        this.vtbl.get_description := CallbackCreate(GetMethod(implObj, "get_description"), flags, 2)
        this.vtbl.get_URL := CallbackCreate(GetMethod(implObj, "get_URL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_mimeType)
        CallbackFree(this.vtbl.get_pictureType)
        CallbackFree(this.vtbl.get_description)
        CallbackFree(this.vtbl.get_URL)
    }
}
