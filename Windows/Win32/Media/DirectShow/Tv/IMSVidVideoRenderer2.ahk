#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IUnknown>} AllocPresent 
     * @returns {HRESULT} 
     */
    get_Allocator(AllocPresent) {
        result := ComCall(46, this, "ptr", AllocPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRSurfaceAllocator>} AllocPresent 
     * @returns {HRESULT} 
     */
    get__Allocator(AllocPresent) {
        result := ComCall(47, this, "ptr", AllocPresent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ID 
     * @returns {HRESULT} 
     */
    get_Allocator_ID(ID) {
        result := ComCall(48, this, "int*", ID, "int")
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
        result := ComCall(49, this, "ptr", AllocPresent, "int", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVMRSurfaceAllocator>} AllocPresent 
     * @param {Integer} ID 
     * @returns {HRESULT} 
     */
    _SetAllocator2(AllocPresent, ID) {
        result := ComCall(50, this, "ptr", AllocPresent, "int", ID, "int")
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
        result := ComCall(51, this, "short", bSuppress, "int")
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
        result := ComCall(52, this, "ptr", bSuppress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
