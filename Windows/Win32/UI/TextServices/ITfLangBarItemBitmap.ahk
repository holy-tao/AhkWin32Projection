#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\ITfLangBarItem.ahk" { ITfLangBarItem }
#Import ".\TfLBIClick.ahk" { TfLBIClick }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The ITfLangBarItemBitmap interface is implemented by an application or text service and used by the language bar manager to obtain information specific to a bitmap item on the language bar.
 * @remarks
 * A language bar bitmap functions as a static item on the language bar that displays a bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritembitmap
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemBitmap extends ITfLangBarItem {
    /**
     * The interface identifier for ITfLangBarItemBitmap
     * @type {Guid}
     */
    static IID := Guid("{73830352-d722-4179-ada5-f045c98df355}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemBitmap interfaces
    */
    struct Vtbl extends ITfLangBarItem.Vtbl {
        OnClick          : IntPtr
        GetPreferredSize : IntPtr
        DrawBitmap       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemBitmap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarItemBitmap::OnClick method
     * @param {TfLBIClick} click Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> values that indicate which mouse button was used to click the bitmap.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the position of the mouse cursor, in screen coordinates, at the time of the click event.
     * @param {Pointer<RECT>} prcArea Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the bounding rectangle, in screen coordinates, of the bitmap.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmap-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, TfLBIClick, click, POINT, pt, RECT.Ptr, prcArea, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmap::GetPreferredSize method
     * @param {Pointer<SIZE>} pszDefault Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that contains the default size, in pixels, of the bitmap.
     * @returns {SIZE} Pointer to a <b>SIZE</b> structure that receives the preferred size, in pixels, of the bitmap. The <b>cy</b> member of this structure is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmap-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(8, this, SIZE.Ptr, pszDefault, SIZE.Ptr, psz, "HRESULT")
        return psz
    }

    /**
     * ITfLangBarItemBitmap::DrawBitmap method
     * @param {Integer} bmWidth Contains the width, in pixels, of the bitmap item.
     * @param {Integer} bmHeight Contains the height, in pixels, of the bitmap item.
     * @param {Integer} dwFlags Not currently used.
     * @param {Pointer<HBITMAP>} phbmp Pointer to an <i>HBITMAP</i> value that receives the handle of the bitmap drawn for the bitmap item.
     * @param {Pointer<HBITMAP>} phbmpMask Pointer to an <b>HBITMAP</b> value that receives the handle of the mask bitmap. This is a monochrome bitmap that functions as a mask for <i>phbmp</i>. Each black pixel in this bitmap will cause the corresponding pixel in <i>phbmp</i> to be displayed in its normal color. Every white pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in the inverse of its normal color.
     * 
     * To display the bitmap without any color conversion, create a monochrome bitmap the same size as <i>phbmp</i> and set each pixel to black (RGB(0, 0, 0)).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmap-drawbitmap
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(9, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, HBITMAP.Ptr, phbmp, HBITMAP.Ptr, phbmpMask, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfLangBarItemBitmap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnClick := CallbackCreate(GetMethod(implObj, "OnClick"), flags, 4)
        this.vtbl.GetPreferredSize := CallbackCreate(GetMethod(implObj, "GetPreferredSize"), flags, 3)
        this.vtbl.DrawBitmap := CallbackCreate(GetMethod(implObj, "DrawBitmap"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnClick)
        CallbackFree(this.vtbl.GetPreferredSize)
        CallbackFree(this.vtbl.DrawBitmap)
    }
}
