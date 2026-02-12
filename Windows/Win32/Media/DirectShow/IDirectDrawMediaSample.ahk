#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawMediaSample interface provides access to DirectDraw surfaces allocated by the Overlay Mixer filter.The allocator for the Overlay Mixer filter creates samples that expose this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/amstream/nn-amstream-idirectdrawmediasample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawMediaSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawMediaSample
     * @type {Guid}
     */
    static IID => Guid("{ab6b4afe-f6e4-11d0-900d-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurfaceAndReleaseLock", "LockMediaSamplePointer"]

    /**
     * The GetSurfaceAndReleaseLock method retrieves and unlocks the surface that the sample represents.
     * @remarks
     * The caller should release the returned surface pointer, except when calling the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter's implementation of this interface.
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface Address of a pointer to the sample's <b>IDirectDrawSurface</b> interface.
     * @param {Pointer<RECT>} pRect Pointer to a variable that receives the address of the rectangle defining the part of the surface that the sample represents.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/amstream/nf-amstream-idirectdrawmediasample-getsurfaceandreleaselock
     */
    GetSurfaceAndReleaseLock(ppDirectDrawSurface, pRect) {
        result := ComCall(3, this, "ptr*", ppDirectDrawSurface, "ptr", pRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The LockMediaSamplePointer method locks the surface that the sample represents.
     * @remarks
     * Call this method only after calling <a href="https://docs.microsoft.com/windows/desktop/api/amstream/nf-amstream-idirectdrawmediasample-getsurfaceandreleaselock">IDirectDrawMediaSample::GetSurfaceAndReleaseLock</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api//content/amstream/nf-amstream-idirectdrawmediasample-lockmediasamplepointer
     */
    LockMediaSamplePointer() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
