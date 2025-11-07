#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The GdiplusAbort structure provides a mechanism that allows Windows GDI+ to call an application-defined Abort method periodically during time-consuming rendering operations.
 * @remarks
 * 
 * The <b>GdiplusAbort</b> structure has only one method, a virtual method named <b>Abort</b>. The <b>GdiplusAbort</b> structure has no data members.
 * 
 * To create a callback method, follow these steps.
 * 
 * <ol>
 * <li>
 * Create a structure that descends from <b>GdiplusAbort</b>, and implement the following method.
 * 
 * <c>HRESULT __stdcall Abort(void)</c>
 * 
 * </li>
 * <li>Create data members to hold any data that will be needed by the <b>Abort</b> method.</li>
 * <li>Pass the address of the <b>GdiplusAbort</b> descendant to the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-image-setabort">Image::SetAbort</a> method.</li>
 * </ol>
 * During certain time-consuming rendering operations (for example, a call to the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusgraphics/nf-gdiplusgraphics-graphics-drawimage(inimage_inconstpointf_inint)">Graphics::DrawImage</a> method), GDI+ calls the <b>Abort</b> method periodically. For some operations the callback is every 250 milliseconds; for other operations the callback is not based on a timer. If the <b>Abort</b> method returns S_OK, GDI+ continues the rendering operation. If the <b>Abort</b> method returns E_ABORT, GDI+ aborts the rendering operation.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/ns-gdiplustypes-gdiplusabort
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusAbort extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Abort"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(0, this, "HRESULT")
        return result
    }
}
