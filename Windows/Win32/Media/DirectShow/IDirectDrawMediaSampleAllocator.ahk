#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawMediaSampleAllocator interface allocates samples that contain DirectDraw surfaces.The Overlay Mixer filter's input pin creates an allocator that implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//amstream/nn-amstream-idirectdrawmediasampleallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawMediaSampleAllocator extends IUnknown{
    /**
     * The interface identifier for IDirectDrawMediaSampleAllocator
     * @type {Guid}
     */
    static IID => Guid("{ab6b4afc-f6e4-11d0-900d-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirectDraw>} ppDirectDraw 
     * @returns {HRESULT} 
     */
    GetDirectDraw(ppDirectDraw) {
        result := ComCall(3, this, "ptr", ppDirectDraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
