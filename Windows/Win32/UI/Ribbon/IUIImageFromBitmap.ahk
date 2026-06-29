#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UI_OWNERSHIP.ahk" { UI_OWNERSHIP }
#Import ".\IUIImage.ahk" { IUIImage }

/**
 * IUIImageFromBitmap is a factory interface implemented by the Windows Ribbon framework that defines the method for creating an IUIImage object.
 * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nn-uiribbon-iuiimagefrombitmap
 * @namespace Windows.Win32.UI.Ribbon
 */
export default struct IUIImageFromBitmap extends IUnknown {
    /**
     * The interface identifier for IUIImageFromBitmap
     * @type {Guid}
     */
    static IID := Guid("{18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIImageFromBitmap interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIImageFromBitmap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IUIImage object from a bitmap image.
     * @remarks
     * This factory method is useful when an application dynamically generates an image 
     * 				 resource and wants to pass the new HBITMAP to the Ribbon, 
     * 				 for example, loading a Portable Network Graphics (PNG) through the Windows Imaging Component (WIC) or using 
     * 				 <a href="https://docs.microsoft.com/previous-versions//ms532292(v=vs.85)">CreateDIBSection</a> to create an image for a new style 
     * 				 in a styles gallery.
     * 			
     * 
     * This method is also useful for applications that require a 
     * 				pre-existing bitmap image that has not been rendered obsolete by the Ribbon, 
     * 				for example, a legacy toolbar image strip.
     * 			
     * 
     * Specify <b>UI_OWNERSHIP_COPY</b> as the value for <i>options</i> if the Ribbon is being implemented in an 
     * 				existing application and minimal code changes are required. This method uses extra memory 
     * 				for the additional image.
     * 			
     * 
     * Specify <b>UI_OWNERSHIP_TRANSFER</b> as the value for <i>options</i> to minimize memory usage.
     * @param {HBITMAP} _bitmap Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap that contains the image.
     * @param {UI_OWNERSHIP} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_ownership">UI_OWNERSHIP</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_ownership">ownership conditions</a> under which 
     * 					an image is created.
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>UI_OWNERSHIP_TRANSFER</td>
     * <td>If <b>UI_OWNERSHIP_TRANSFER</b> is specified as the value of 
     * 				<i>options</i>, then the Ribbon framework owns 
     * 					the handle to the bitmap (HBITMAP) through the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiimage">IUIImage</a> object and 
     * 					releases it when the framework no longer requires it.
     * 				<div class="alert"><b>Note</b>  This option prevents the Ribbon host application from safely referencing the same HBITMAP 
     * 					elsewhere in the application UI.
     * 				</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>UI_OWNERSHIP_COPY</td>
     * <td>If <b>UI_OWNERSHIP_COPY</b> is specified as the value of 
     * 				<i>options</i>, then the host application owns the 
     * 					HBITMAP and is able to reference the same HBITMAP for use elsewhere in the 
     * 					UI.
     * 				<div class="alert"><b>Note</b>  This option places responsibility for releasing the HBITMAP on the 
     * 					host application.
     * 				</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @returns {IUIImage} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiimage">IUIImage</a>**</b>
     * 
     * When this method returns, contains the address of a pointer variable that receives the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiimage">IUIImage</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiimagefrombitmap-createimage
     */
    CreateImage(_bitmap, options) {
        result := ComCall(3, this, HBITMAP, _bitmap, UI_OWNERSHIP, options, "ptr*", &_image := 0, "HRESULT")
        return IUIImage(_image)
    }

    Query(iid) {
        if (IUIImageFromBitmap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateImage := CallbackCreate(GetMethod(implObj, "CreateImage"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateImage)
    }
}
