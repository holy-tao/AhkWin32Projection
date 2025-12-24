#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk
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
     * The IsSurfaceLocked method indicates whether the DirectDraw surface attached to this media sample is locked.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurface-issurfacelocked
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The LockSurface method locks the attached DirectDraw surface.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to the locked bits.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurface-locksurface
     */
    LockSurface() {
        result := ComCall(4, this, "ptr*", &lpSurface := 0, "HRESULT")
        return lpSurface
    }

    /**
     * The UnlockSurface method unlocks the attached DirectDraw surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No DirectDraw surface is attached to this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurface-unlocksurface
     */
    UnlockSurface() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetSurface method retrieves the attached DirectDraw surface interface.
     * @returns {IDirectDrawSurface7} Address of a variable that receives a pointer to the <b>IDirectDrawSurface7</b> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrsurface-getsurface
     */
    GetSurface() {
        result := ComCall(6, this, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirectDrawSurface7(lplpSurface)
    }
}
