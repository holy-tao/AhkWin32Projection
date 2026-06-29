#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidVideoRenderer.ahk" { IMSVidVideoRenderer }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidVMR9 interface represents the Video Mixing Renderer Filter 9 (VMR-9) within the Video Control filter graph. The MSVidVMR9 object exposes this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVMR9)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidvmr9
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidVMR9 extends IMSVidVideoRenderer {
    /**
     * The interface identifier for IMSVidVMR9
     * @type {Guid}
     */
    static IID := Guid("{d58b0015-ebef-44bb-bbdd-3f3699d76ea1}")

    /**
     * The class identifier for MSVidVMR9
     * @type {Guid}
     */
    static CLSID := Guid("{24dc3975-09bf-4231-8655-3ee71f43837d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidVMR9 interfaces
    */
    struct Vtbl extends IMSVidVideoRenderer.Vtbl {
        get_Allocator_ID    : IntPtr
        SetAllocator        : IntPtr
        put_SuppressEffects : IntPtr
        get_SuppressEffects : IntPtr
        get_Allocator       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidVMR9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Allocator_ID {
        get => this.get_Allocator_ID()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SuppressEffects {
        get => this.get_SuppressEffects()
        set => this.put_SuppressEffects(value)
    }

    /**
     * @type {IUnknown} 
     */
    Allocator {
        get => this.get_Allocator()
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * To set a custom allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvmr9-setallocator">IMSVidVMR9::SetAllocator</a>.
     * @returns {Integer} Receives the identifier. If the application did not set an allocator-presenter, the value is –1.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_allocator_id
     */
    get_Allocator_ID() {
        result := ComCall(46, this, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @param {IUnknown} AllocPresent Pointer to the <b>IUnknown</b> interface of the allocator-presenter. This object must expose the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrsurfaceallocator9">IVMRSurfaceAllocator9</a> interface. To use the VMR-9 filter's default allocator-presenter, set this parameter to <b>NULL</b>.
     * @param {Integer} ID Application-defined identifier for the allocator-presenter.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-setallocator
     */
    SetAllocator(AllocPresent, ID) {
        result := ComCall(47, this, "ptr", AllocPresent, "int", ID, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * If <i>bSuppress</i> equals VARIANT_TRUE, the Video Control configures several system parameters during video playback:
     * 
     * <ul>
     * <li>Disables the screen saver timeout.</li>
     * <li>Disables Microsoft ClearType smoothing.</li>
     * <li>Disables the drop shadow effect.</li>
     * <li>Disables alpha-blended mouse cursors.</li>
     * <li>Prevents the system from turning off the display (power management).</li>
     * </ul>
     * For applications based on the Windows Graphics Device Interface (GDI), these settings improve the video playback experience. When playback stops, the Video Control restores the original system settings.
     * 
     * If <i>bSuppress</i> equals VARIANT_FALSE, the Video Control does not modify any of these system settings.
     * 
     * The default value for this property is VARIANT_TRUE. Set this property to VARIANT_FALSE if your application wants to control all of the system settings; for example, if you are providing a custom allocator-presenter (see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvmr9-setallocator">IMSVidVMR9::SetAllocator</a>).
     * @param {VARIANT_BOOL} bSuppress Specifies a Boolean value. See Remarks for more information.
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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, VARIANT_BOOL, bSuppress, "HRESULT")
        return result
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @returns {VARIANT_BOOL} Receives a <b>VARIANT_BOOL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvmr9-put_suppresseffects">IMSVidVMR9::put_SuppressEffects</a>. The default value is VARIANT_TRUE.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(49, this, VARIANT_BOOL.Ptr, &bSuppress := 0, "HRESULT")
        return bSuppress
    }

    /**
     * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005.
     * @remarks
     * To set a custom allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvmr9-setallocator">IMSVidVMR9::SetAllocator</a>.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of the allocator-presenter. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_allocator
     */
    get_Allocator() {
        result := ComCall(50, this, "ptr*", &AllocPresent := 0, "HRESULT")
        return IUnknown(AllocPresent)
    }

    Query(iid) {
        if (IMSVidVMR9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Allocator_ID := CallbackCreate(GetMethod(implObj, "get_Allocator_ID"), flags, 2)
        this.vtbl.SetAllocator := CallbackCreate(GetMethod(implObj, "SetAllocator"), flags, 3)
        this.vtbl.put_SuppressEffects := CallbackCreate(GetMethod(implObj, "put_SuppressEffects"), flags, 2)
        this.vtbl.get_SuppressEffects := CallbackCreate(GetMethod(implObj, "get_SuppressEffects"), flags, 2)
        this.vtbl.get_Allocator := CallbackCreate(GetMethod(implObj, "get_Allocator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Allocator_ID)
        CallbackFree(this.vtbl.SetAllocator)
        CallbackFree(this.vtbl.put_SuppressEffects)
        CallbackFree(this.vtbl.get_SuppressEffects)
        CallbackFree(this.vtbl.get_Allocator)
    }
}
