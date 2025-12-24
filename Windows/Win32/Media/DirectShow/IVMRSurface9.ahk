#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSurfaceLocked", "LockSurface", "UnlockSurface", "GetSurface"]

    /**
     * The IsSurfaceLocked method indicates whether the Direct3D surface attached to this media sample is locked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurface9-issurfacelocked
     */
    IsSurfaceLocked() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The LockSurface method locks the attached Direct3D surface.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to the locked bits.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurface9-locksurface
     */
    LockSurface() {
        result := ComCall(4, this, "ptr*", &lpSurface := 0, "HRESULT")
        return lpSurface
    }

    /**
     * The UnlockSurface method unlocks the attached Direct3D surface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No Direct3D surface is attached to this sample.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurface9-unlocksurface
     */
    UnlockSurface() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The GetSurface method retrieves the attached Direct3D surface.
     * @returns {IDirect3DSurface9} Address of a variable that receives an <b>IDirect3DSurface9</b> interface pointer. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vmr9/nf-vmr9-ivmrsurface9-getsurface
     */
    GetSurface() {
        result := ComCall(6, this, "ptr*", &lplpSurface := 0, "HRESULT")
        return IDirect3DSurface9(lplpSurface)
    }
}
