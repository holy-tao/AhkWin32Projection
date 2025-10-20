#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurface9 interface is implemented on the media samples used by the Video Mixing Renderer Filter 9.
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrsurface9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurface9 extends IUnknown{
    /**
     * The interface identifier for IVMRSurface9
     * @type {Guid}
     */
    static IID => Guid("{dfc581a1-6e1f-4c3a-8d0a-5e9792ea2afc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpSurface 
     * @returns {HRESULT} 
     */
    LockSurface(lpSurface) {
        result := ComCall(4, this, "char*", lpSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnlockSurface() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} lplpSurface 
     * @returns {HRESULT} 
     */
    GetSurface(lplpSurface) {
        result := ComCall(6, this, "ptr", lplpSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
