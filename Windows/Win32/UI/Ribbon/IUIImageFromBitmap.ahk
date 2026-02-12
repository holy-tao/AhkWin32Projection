#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIImage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IUIImageFromBitmap is a factory interface implemented by the Windows Ribbon framework that defines the method for creating an IUIImage object.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nn-uiribbon-iuiimagefrombitmap
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIImageFromBitmap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIImageFromBitmap
     * @type {Guid}
     */
    static IID => Guid("{18aba7f3-4c1c-4ba2-bf6c-f5c3326fa816}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateImage"]

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
     * @param {HBITMAP} bitmap_ Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap that contains the image.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/ne-uiribbon-ui_ownership">UI_OWNERSHIP</a></b>
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
     * @returns {IUIImage} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiribbon/nf-uiribbon-iuiimagefrombitmap-createimage
     */
    CreateImage(bitmap_, options) {
        bitmap_ := bitmap_ is Win32Handle ? NumGet(bitmap_, "ptr") : bitmap_

        result := ComCall(3, this, "ptr", bitmap_, "int", options, "ptr*", &image_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUIImage(image_)
    }
}
