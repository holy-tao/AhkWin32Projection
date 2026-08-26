#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IDirectDraw.ahk
#Include ..\Gdi\RGNDATA.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawClipper interface to manage clip lists. This section is a reference to the methods of this interface.
 * @remarks
 * The methods of the <b>IDirectDrawClipper</b> interface can be organized into the following groups:<table>
 * <tr>
 * <th>Group</th>
 * <th>Methods</th>
 * </tr>
 * <tr>
 * <td>Allocating memory</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-initialize">Initialize</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Clip list</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-getcliplist">GetClipList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-iscliplistchanged">IsClipListChanged</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-setcliplist">SetClipList</a>,  and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-sethwnd">SetHWnd</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Handles</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-gethwnd">GetHWnd</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * You can use the LPDIRECTDRAWCLIPPER data type to declare a variable that contains a pointer to an <b>IDirectDrawClipper</b> interface. The Ddraw.h header file declares this data type with the following code:
 * 
 * 
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDrawClipper    FAR *LPDIRECTDRAWCLIPPER;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nn-ddraw-idirectdrawclipper
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class IDirectDrawClipper extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawClipper
     * @type {Guid}
     */
    static IID => Guid("{6c14db85-a733-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClipList", "GetHWnd", "Initialize", "IsClipListChanged", "SetClipList", "SetHWnd"]

    /**
     * Retrieves a copy of the clip list that is associated with a DirectDrawClipper object. To select a subset of the clip list, you can pass a rectangle that clips the clip list.
     * @param {Pointer<RECT>} param0 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that <b>GetClipList</b> uses to clip the clip list. Set this parameter to NULL to retrieve the entire clip list.
     * @param {Pointer<RGNDATA>} param1 A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure that receives the resulting copy of the clip list. If this parameter is NULL, <b>GetClipList</b> fills the variable at <i>lpdwSize</i> with the number of bytes necessary to hold the entire clip list.
     * @param {Pointer<Integer>} param2 A pointer to a variable that receives the size of the resulting clip list. When retrieving the clip list, this parameter is the size of the buffer at <i>lpClipList</i>. When <i>lpClipList</i> is NULL, the variable at <i>lpdwSize</i> receives the required size of the buffer, in bytes.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDCLIPLIST</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOCLIPLIST</li>
     * <li>DDERR_REGIONTOOSMALL</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-getcliplist
     */
    GetClipList(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", param0, "ptr", param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * Retrieves the window handle that was previously associated with this DirectDrawClipper object by the IDirectDrawClipper::SetHWnd method.
     * @param {Pointer<HWND>} param0 A pointer to a variable that receives the window handle that was previously associated with this DirectDrawClipper object by the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawclipper-sethwnd">IDirectDrawClipper::SetHWnd</a> method.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-gethwnd
     */
    GetHWnd(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initializes a DirectDrawClipper object that was created by using the CoCreateInstance COM function.
     * @remarks
     * The <b>IDirectDrawClipper::Initialize</b> method is provided for compliance with the Component Object Model (COM). If you used the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreateclipper">DirectDrawCreateClipper</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createclipper">IDirectDraw7::CreateClipper</a> method to create the DirectDrawClipper object, the <b>IDirectDrawClipper::Initialize</b> method returns DDERR_ALREADYINITIALIZED.
     * @param {IDirectDraw} param0 A pointer to the DirectDraw object to associate with the DirectDrawClipper object. If this parameter is set to NULL, an independent DirectDrawClipper object is initialized; a call of this type is equivalent to using the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreateclipper">DirectDrawCreateClipper</a> function.
     * @param {Integer} param1 Currently not used and must be set to 0.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_ALREADYINITIALIZED</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(5, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the status of the clip list if a window handle is associated with a DirectDrawClipper object.
     * @param {Pointer<BOOL>} param0 A pointer to a variable that receives the status of the clip list. This parameter is TRUE if the clip list has changed, and FALSE otherwise.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-iscliplistchanged
     */
    IsClipListChanged(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Sets or deletes the clip list that is used by the IDirectDrawSurface7::Blt, IDirectDrawSurface7::BltBatch, and IDirectDrawSurface7::UpdateOverlay methods on surfaces to which the parent DirectDrawClipper object is attached.
     * @remarks
     * You cannot set the clip list if a window handle is already associated with the DirectDrawClipper object. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-bltfast">IDirectDrawSurface7::BltFast</a> method cannot clip. If you call <b>IDirectDrawSurface7::BltFast</b> on a surface with an attached clipper, it returns DDERR_UNSUPPORTED.
     * @param {Pointer<RGNDATA>} param0 A pointer to a valid <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> structure for the clip list to set or NULL. If there is an existing clip list that is associated with the DirectDrawClipper object and this value is NULL, the clip list is deleted.
     * @param {Integer} param1 Currently not used and must be set to 0.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CLIPPERISUSINGHWND</li>
     * <li>DDERR_INVALIDCLIPLIST</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-setcliplist
     */
    SetClipList(param0, param1) {
        result := ComCall(7, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Sets the window handle that the clipper object uses to obtain clipping information.
     * @param {Integer} param0 Currently not used and must be set to 0.
     * @param {HWND} param1 Window handle that obtains the clipping information.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDCLIPLIST</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawclipper-sethwnd
     */
    SetHWnd(param0, param1) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }
}
