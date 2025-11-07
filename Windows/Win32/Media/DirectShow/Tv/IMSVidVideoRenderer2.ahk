#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\IVMRSurfaceAllocator.ahk
#Include .\IMSVidVideoRenderer.ahk

/**
 * The IMSVidVideoRenderer2 interface represents a video renderer device.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRenderer2)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvideorenderer2
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
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-get_allocator
     */
    get_Allocator() {
        result := ComCall(46, this, "ptr*", &AllocPresent := 0, "HRESULT")
        return IUnknown(AllocPresent)
    }

    /**
     * 
     * @returns {IVMRSurfaceAllocator} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-get__allocator
     */
    get__Allocator() {
        result := ComCall(47, this, "ptr*", &AllocPresent := 0, "HRESULT")
        return IVMRSurfaceAllocator(AllocPresent)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-get_allocator_id
     */
    get_Allocator_ID() {
        result := ComCall(48, this, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * 
     * @param {IUnknown} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-setallocator
     */
    SetAllocator(AllocPresent, ID) {
        result := ComCall(49, this, "ptr", AllocPresent, "int", ID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVMRSurfaceAllocator} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     */
    _SetAllocator2(AllocPresent, ID) {
        result := ComCall(50, this, "ptr", AllocPresent, "int", ID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSuppress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(51, this, "short", bSuppress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorenderer2-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(52, this, "short*", &bSuppress := 0, "HRESULT")
        return bSuppress
    }
}
