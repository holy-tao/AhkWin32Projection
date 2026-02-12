#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\IVMRSurfaceAllocator.ahk
#Include .\IMSVidVideoRenderer.ahk

/**
 * The IMSVidVideoRenderer2 interface represents a video renderer device.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRenderer2)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/segment/nn-segment-imsvidvideorenderer2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoRenderer2 extends IMSVidVideoRenderer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoRenderer2
     * @type {Guid}
     */
    static IID => Guid("{6bdd5c1e-2810-4159-94bc-05511ae8549b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 46

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Allocator", "get__Allocator", "get_Allocator_ID", "SetAllocator", "_SetAllocator2", "put_SuppressEffects", "get_SuppressEffects"]

    /**
     * @type {IUnknown} 
     */
    Allocator {
        get => this.get_Allocator()
    }

    /**
     * @type {IVMRSurfaceAllocator} 
     */
    _Allocator {
        get => this.get__Allocator()
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
     * The get_Allocator method retrieves the allocator-presenter from the VMR as an IUnknown pointer.
     * @remarks
     * The caller must release the returned <b>IUnknown</b> interface.
     * @returns {IUnknown} Receives a pointer to the allocator-presenter's <b>IUnknown</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-get_allocator
     */
    get_Allocator() {
        result := ComCall(46, this, "ptr*", &AllocPresent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(AllocPresent)
    }

    /**
     * The get__Allocator method retrieves the allocator-presenter from the VMR.
     * @remarks
     * The caller must release the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocator">IVMRSurfaceAllocator</a> interface.
     * @returns {IVMRSurfaceAllocator} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrsurfaceallocator">IVMRSurfaceAllocator</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-get__allocator
     */
    get__Allocator() {
        result := ComCall(47, this, "ptr*", &AllocPresent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVMRSurfaceAllocator(AllocPresent)
    }

    /**
     * The get_Allocator_ID method retrieves an identifier for the VMR filter's allocator-presenter.
     * @remarks
     * The identifier is for application use; it is not used by the VMR.
     * @returns {Integer} Receives the identifier. If the returned value is -1, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorenderer">MSVidVideoRenderer</a> object will assign a default identifier when it builds the filter graph.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-get_allocator_id
     */
    get_Allocator_ID() {
        result := ComCall(48, this, "int*", &ID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID
    }

    /**
     * The SetAllocator method specifies an allocator-presenter for the VMR. Applications can use this method to provide their own custom allocator-presenter objects.
     * @param {IUnknown} AllocPresent Pointer to the <b>IUnknown</b> interface of the allocator-presenter object.
     * @param {Integer} ID Optionally, specifies an identifier (ID) for the allocator-presenter object. The default value of -1 indicates that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd695138(v=vs.85)">MSVidVideoRenderer</a> object will create an ID when it builds the filter graph. In that case, the MSVidVideoRenderer object uses the lower 32 bits of the allocator-presenter's <b>IUnknown</b> interface pointer as the ID. Note that the ID is for application use; the VMR does not use it.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-setallocator
     */
    SetAllocator(AllocPresent, ID) {
        result := ComCall(49, this, "ptr", AllocPresent, "int", ID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVMRSurfaceAllocator} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     */
    _SetAllocator2(AllocPresent, ID) {
        result := ComCall(50, this, "ptr", AllocPresent, "int", ID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_SuppressEffects method sets preferences for power management and visual effects.
     * @remarks
     * If <i>bSuppress</i> equals VARIANT_TRUE, the Video Control does the following:
     * 
     * <ul>
     * <li>Disables font smoothing and the system-wide drop shadow effect. (Only when the Video Control is using hardware overlay.) This is useful if the application draws onto the overlay.</li>
     * <li>Disables the screen saver, and turns off power management for the display. This is useful to prevent the operating system from interrupting playback while the user is watching a program.</li>
     * </ul>
     * The Video Control restores the original system settings after it stops.
     * 
     * If <i>bSuppress</i> equals VARIANT_FALSE, the Video Control uses the existing system settings.
     * @param {VARIANT_BOOL} bSuppress Specifies a Boolean value. See Remarks for more information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(51, this, "short", bSuppress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_SuppressEffects method retrieves settings that control power management and visual effects.
     * @returns {VARIANT_BOOL} Receives the value VARIANT_TRUE or VARIANT_FALSE. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidvideorenderer2-put_suppresseffects">IMSVidVideoRenderer2::put_SuppressEffects</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidvideorenderer2-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(52, this, "short*", &bSuppress := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bSuppress
    }
}
