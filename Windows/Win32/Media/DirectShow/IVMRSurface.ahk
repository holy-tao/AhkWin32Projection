#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRSurface interface is implemented on the media samples used by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrsurface
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRSurface extends IUnknown{
    /**
     * The interface identifier for IVMRSurface
     * @type {Guid}
     */
    static IID => Guid("{a9849bbe-9ec8-4263-b764-62730f0d15d0}")

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
     * @param {Pointer<IDirectDrawSurface7>} lplpSurface 
     * @returns {HRESULT} 
     */
    GetSurface(lplpSurface) {
        result := ComCall(6, this, "ptr", lplpSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
