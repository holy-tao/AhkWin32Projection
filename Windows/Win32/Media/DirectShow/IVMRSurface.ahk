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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSurfaceLocked", "LockSurface", "UnlockSurface", "GetSurface"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-issurfacelocked
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} lpSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-locksurface
     */
    LockSurface(lpSurface) {
        lpSurfaceMarshal := lpSurface is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, lpSurfaceMarshal, lpSurface, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-unlocksurface
     */
    UnlockSurface() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface7>} lplpSurface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrsurface-getsurface
     */
    GetSurface(lplpSurface) {
        result := ComCall(6, this, "ptr*", lplpSurface, "HRESULT")
        return result
    }
}
