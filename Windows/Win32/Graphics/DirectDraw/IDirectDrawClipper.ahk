#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Gdi\RGNDATA.ahk" { RGNDATA }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDirectDraw.ahk" { IDirectDraw }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\RECT.ahk" { RECT }

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
export default struct IDirectDrawClipper extends IUnknown {
    /**
     * The interface identifier for IDirectDrawClipper
     * @type {Guid}
     */
    static IID := Guid("{6c14db85-a733-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawClipper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClipList       : IntPtr
        GetHWnd           : IntPtr
        Initialize        : IntPtr
        IsClipListChanged : IntPtr
        SetClipList       : IntPtr
        SetHWnd           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawClipper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a copy of the clip list that is associated with a DirectDrawClipper object. To select a subset of the clip list, you can pass a rectangle that clips the clip list.
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<RGNDATA>} param1 
     * @param {Pointer<Integer>} param2 
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

        result := ComCall(3, this, RECT.Ptr, param0, RGNDATA.Ptr, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * Retrieves the window handle that was previously associated with this DirectDrawClipper object by the IDirectDrawClipper::SetHWnd method.
     * @param {Pointer<HWND>} param0 
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
        result := ComCall(4, this, HWND.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * Initializes a DirectDrawClipper object that was created by using the CoCreateInstance COM function.
     * @remarks
     * The <b>IDirectDrawClipper::Initialize</b> method is provided for compliance with the Component Object Model (COM). If you used the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreateclipper">DirectDrawCreateClipper</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createclipper">IDirectDraw7::CreateClipper</a> method to create the DirectDrawClipper object, the <b>IDirectDrawClipper::Initialize</b> method returns DDERR_ALREADYINITIALIZED.
     * @param {IDirectDraw} param0 
     * @param {Integer} param1 
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
     * @param {Pointer<BOOL>} param0 
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
     * @param {Pointer<RGNDATA>} param0 
     * @param {Integer} param1 
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
        result := ComCall(7, this, RGNDATA.Ptr, param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Sets the window handle that the clipper object uses to obtain clipping information.
     * @param {Integer} param0 
     * @param {HWND} param1 
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
        result := ComCall(8, this, "uint", param0, HWND, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawClipper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClipList := CallbackCreate(GetMethod(implObj, "GetClipList"), flags, 4)
        this.vtbl.GetHWnd := CallbackCreate(GetMethod(implObj, "GetHWnd"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.IsClipListChanged := CallbackCreate(GetMethod(implObj, "IsClipListChanged"), flags, 2)
        this.vtbl.SetClipList := CallbackCreate(GetMethod(implObj, "SetClipList"), flags, 3)
        this.vtbl.SetHWnd := CallbackCreate(GetMethod(implObj, "SetHWnd"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClipList)
        CallbackFree(this.vtbl.GetHWnd)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.IsClipListChanged)
        CallbackFree(this.vtbl.SetClipList)
        CallbackFree(this.vtbl.SetHWnd)
    }
}
