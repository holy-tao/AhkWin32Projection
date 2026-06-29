#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMPLibraryType.ahk" { WMPLibraryType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMediaCollection.ahk" { IWMPMediaCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPLibrary interface represents a library.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmplibrary
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPLibrary extends IUnknown {
    /**
     * The interface identifier for IWMPLibrary
     * @type {Guid}
     */
    static IID := Guid("{3df47861-7df1-4c1f-a81b-4c26f0f7a7c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPLibrary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_name            : IntPtr
        get_type            : IntPtr
        get_mediaCollection : IntPtr
        isIdentical         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_name
     */
    get_name(pbstrName) {
        result := ComCall(3, this, BSTR.Ptr, pbstrName, "HRESULT")
        return result
    }

    /**
     * The get_type method retrieves a value that indicates the library type.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<WMPLibraryType>} pwmplt Pointer to a variable that receives a value from the <b>WMPLibraryType</b> enumeration that indicates the library type.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_type
     */
    get_type(pwmplt) {
        pwmpltMarshal := pwmplt is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pwmpltMarshal, pwmplt, "HRESULT")
        return result
    }

    /**
     * The get_mediaCollection method retrieves a pointer to the IWMPMediaCollection interface for the current library.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {IWMPMediaCollection} Address of a variable that receives a pointer to the <b>IWMPMediaCollection</b> interface for the current library.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-get_mediacollection
     */
    get_mediaCollection() {
        result := ComCall(5, this, "ptr*", &ppIWMPMediaCollection := 0, "HRESULT")
        return IWMPMediaCollection(ppIWMPMediaCollection)
    }

    /**
     * The isIdentical method retrieves a value that indicates whether the supplied object is the same as the current one.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary-isidentical
     */
    isIdentical(pIWMPLibrary, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(6, this, "ptr", pIWMPLibrary, pvboolMarshal, pvbool, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_type := CallbackCreate(GetMethod(implObj, "get_type"), flags, 2)
        this.vtbl.get_mediaCollection := CallbackCreate(GetMethod(implObj, "get_mediaCollection"), flags, 2)
        this.vtbl.isIdentical := CallbackCreate(GetMethod(implObj, "isIdentical"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_type)
        CallbackFree(this.vtbl.get_mediaCollection)
        CallbackFree(this.vtbl.isIdentical)
    }
}
