#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaSample2Config interface returns a pointer to a Direct3D surface representing a VRAM capture buffer.
 * @remarks
 * 
 * If a display driver supports VRAM capture, the KsProxy filter allocates samples that expose this interface. Downstream filters can use this interface to access the video data in video memory, without requiring the data to be copied into system memory. The display driver must support the Windows Vista Display Driver Model (WDDM).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediasample2config
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSample2Config extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSample2Config
     * @type {Guid}
     */
    static IID => Guid("{68961e68-832b-41ea-bc91-63593f3e70e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSurface"]

    /**
     * The GetSurface method returns a pointer to the Direct3D surface managed by this media sample.
     * @returns {IUnknown} Receives a pointer to the <b>IUnknown</b> interface of the Direct3D surface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediasample2config-getsurface
     */
    GetSurface() {
        result := ComCall(3, this, "ptr*", &ppDirect3DSurface9 := 0, "HRESULT")
        return IUnknown(ppDirect3DSurface9)
    }
}
