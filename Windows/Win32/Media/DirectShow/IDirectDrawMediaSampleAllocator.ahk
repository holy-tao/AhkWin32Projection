#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\IDirectDraw.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDirectDrawMediaSampleAllocator interface allocates samples that contain DirectDraw surfaces.The Overlay Mixer filter's input pin creates an allocator that implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/amstream/nn-amstream-idirectdrawmediasampleallocator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDirectDrawMediaSampleAllocator extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectDraw"]

    /**
     * The GetDirectDraw method retrieves a pointer to the DirectDraw instance used to allocate surfaces.
     * @remarks
     * The caller should release the returned <b>IDirectDraw</b> pointer, except when calling the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/overlay-mixer-filter">Overlay Mixer</a> filter's implementation of this interface.
     * @returns {IDirectDraw} Address of a pointer that receives the DirectDraw object's <b>IDirectDraw</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/amstream/nf-amstream-idirectdrawmediasampleallocator-getdirectdraw
     */
    GetDirectDraw() {
        result := ComCall(3, this, "ptr*", &ppDirectDraw := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDraw(ppDirectDraw)
    }
}
