#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include .\IMSVidVideoRenderer.ahk

/**
 * This topic applies to Update Rollup 2 for Microsoft Windows XP Media Center Edition 2005. The IMSVidVMR9 interface represents the Video Mixing Renderer Filter 9 (VMR-9) within the Video Control filter graph. The MSVidVMR9 object exposes this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVMR9)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvmr9
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVMR9 extends IMSVidVideoRenderer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVMR9
     * @type {Guid}
     */
    static IID => Guid("{d58b0015-ebef-44bb-bbdd-3f3699d76ea1}")

    /**
     * The class identifier for MSVidVMR9
     * @type {Guid}
     */
    static CLSID => Guid("{24dc3975-09bf-4231-8655-3ee71f43837d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 46

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Allocator_ID", "SetAllocator", "put_SuppressEffects", "get_SuppressEffects", "get_Allocator"]

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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_allocator_id
     */
    get_Allocator_ID() {
        result := ComCall(46, this, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * 
     * @param {IUnknown} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-setallocator
     */
    SetAllocator(AllocPresent, ID) {
        result := ComCall(47, this, "ptr", AllocPresent, "int", ID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSuppress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, "short", bSuppress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(49, this, "short*", &bSuppress := 0, "HRESULT")
        return bSuppress
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvmr9-get_allocator
     */
    get_Allocator() {
        result := ComCall(50, this, "ptr*", &AllocPresent := 0, "HRESULT")
        return IUnknown(AllocPresent)
    }
}
