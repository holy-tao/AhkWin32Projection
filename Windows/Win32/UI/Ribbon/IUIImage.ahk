#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUIImage interface is implemented by the application and defines the method for retrieving an image to display in the ribbon and context popup UI of the Windows Ribbon framework .
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuiimage
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIImage extends IUnknown {
    /**
     * The interface identifier for IUIImage
     * @type {Guid}
     */
    static IID := Guid("{23c8c838-4de6-436b-ab01-5554bb7c30dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIImage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBitmap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIImage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a bitmap to display as an icon in the ribbon and context popup UI of the Windows Ribbon framework.
     * @remarks
     * <b>IUIImage::GetBitmap</b> is called on image property callback triggered by <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nf-uiribbon-iuiframework-invalidateuicommand">InvalidateUICommand</a>.
     * @returns {HBITMAP} Type: <b>HBITMAP*</b>
     * 
     * When this method returns, contains a pointer to the handle to the requested bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiimage-getbitmap
     */
    GetBitmap() {
        _bitmap := HBITMAP.Owned()
        result := ComCall(3, this, HBITMAP.Ptr, _bitmap, "HRESULT")
        return _bitmap
    }

    Query(iid) {
        if (IUIImage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBitmap := CallbackCreate(GetMethod(implObj, "GetBitmap"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBitmap)
    }
}
