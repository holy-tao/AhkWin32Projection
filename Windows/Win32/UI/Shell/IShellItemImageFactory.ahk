#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SIIGBF.ahk" { SIIGBF }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Exposes a method to return either icons or thumbnails for Shell items. If no thumbnail or icon is available for the requested item, a per-class icon may be provided from the Shell.
 * @remarks
 * A pointer to this interface is commonly obtained through one of the following functions:
 *                 
 *                 
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist">SHCreateItemFromIDList</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname">SHCreateItemFromParsingName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename">SHCreateItemFromRelativeName</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder">SHCreateItemInKnownFolder</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent">SHCreateItemWithParent</a>
 * </li>
 * </ul>
 * See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940383(v=vs.85)">Using Image Factory</a> sample for a full example of how to use this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemimagefactory
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellItemImageFactory extends IUnknown {
    /**
     * The interface identifier for IShellItemImageFactory
     * @type {Guid}
     */
    static IID := Guid("{bcc18b79-ba16-442f-80c4-8a59c30c463b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellItemImageFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellItemImageFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an HBITMAP that represents an IShellItem.
     * @remarks
     * Icon extraction can be time consuming. This method generally should not be called from a UI thread to avoid causing that thread to become unresponsive. You can call <b>IShellItemImageFactory::GetImage</b> on a UI thread if you set the <b>SIIGBF_INCACHEONLY</b> flag. However, if the image is not found in the cache, the calling application should be prepared to launch a background thread to extract the image. An extraction should never be done on a UI thread.
     * 
     * See the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd940383(v=vs.85)">Using Image Factory</a> sample for a full example of how to use this method.
     * @param {SIZE} _size Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a></b>
     * 
     * A structure that specifies the size of the image to be received.
     * @param {SIIGBF} flags Type: <b>SIIGBF</b>
     * 
     * One or more of the following:
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * Pointer to a value that, when this method returns successfully, receives the handle of the retrieved bitmap. It is the responsibility of the caller to free this retrieved resource through <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemimagefactory-getimage
     */
    GetImage(_size, flags) {
        phbm := HBITMAP.Owned()
        result := ComCall(3, this, SIZE, _size, SIIGBF, flags, HBITMAP.Ptr, phbm, "HRESULT")
        return phbm
    }

    Query(iid) {
        if (IShellItemImageFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImage := CallbackCreate(GetMethod(implObj, "GetImage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImage)
    }
}
