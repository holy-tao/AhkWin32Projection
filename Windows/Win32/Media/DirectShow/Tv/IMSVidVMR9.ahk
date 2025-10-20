#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Int32>} ID 
     * @returns {HRESULT} 
     */
    get_Allocator_ID(ID) {
        result := ComCall(46, this, "int*", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     */
    SetAllocator(AllocPresent, ID) {
        result := ComCall(47, this, "ptr", AllocPresent, "int", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSuppress 
     * @returns {HRESULT} 
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, "short", bSuppress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bSuppress 
     * @returns {HRESULT} 
     */
    get_SuppressEffects(bSuppress) {
        result := ComCall(49, this, "ptr", bSuppress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} AllocPresent 
     * @returns {HRESULT} 
     */
    get_Allocator(AllocPresent) {
        result := ComCall(50, this, "ptr", AllocPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
