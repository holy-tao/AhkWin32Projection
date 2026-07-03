#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPLibrary.ahk" { IWMPLibrary }

/**
 * The IWMPLibrary2 interface represents a media library.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmplibrary2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPLibrary2 extends IWMPLibrary {
    /**
     * The interface identifier for IWMPLibrary2
     * @type {Guid}
     */
    static IID := Guid("{dd578a4e-79b1-426c-bf8f-3add9072500b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPLibrary2 interfaces
    */
    struct Vtbl extends IWMPLibrary.Vtbl {
        getItemInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPLibrary2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The getItemInfo method retrieves the value of the LibraryID attribute.
     * @remarks
     * The <b>LibraryID</b> attribute retrieved by this method is the same as the <b>LibraryID</b> attribute that <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpmedia-getiteminfo">IWMPMedia::getItemInfo</a> retrieves for each media item in the library.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmplibrary2-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(7, this, BSTR, bstrItemName, BSTR.Ptr, pbstrVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPLibrary2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getItemInfo := CallbackCreate(GetMethod(implObj, "getItemInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getItemInfo)
    }
}
