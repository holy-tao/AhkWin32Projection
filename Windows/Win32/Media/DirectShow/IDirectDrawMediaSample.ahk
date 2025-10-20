#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawMediaSample interface provides access to DirectDraw surfaces allocated by the Overlay Mixer filter.The allocator for the Overlay Mixer filter creates samples that expose this interface.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-idirectdrawmediasample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawMediaSample extends IUnknown{
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
     * 
     * @param {Pointer<IDirectDrawSurface>} ppDirectDrawSurface 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetSurfaceAndReleaseLock(ppDirectDrawSurface, pRect) {
        result := ComCall(3, this, "ptr", ppDirectDrawSurface, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockMediaSamplePointer() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
