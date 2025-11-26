#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\DirectDraw\DDCOLORKEY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRVideoStreamControl interface is implemented on each input pin of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrvideostreamcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRVideoStreamControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRVideoStreamControl
     * @type {Guid}
     */
    static IID => Guid("{058d1f11-2a54-4bef-bd54-df706626b727}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetColorKey", "GetColorKey", "SetStreamActiveState", "GetStreamActiveState"]

    /**
     * The SetColorKey method sets the source color key that the VMR will use when compositing the video image.
     * @param {Pointer<DDCOLORKEY>} lpClrKey Specifies the source color key as a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-ddcolorkey">DDCOLORKEY</a> type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrvideostreamcontrol-setcolorkey
     */
    SetColorKey(lpClrKey) {
        result := ComCall(3, this, "ptr", lpClrKey, "HRESULT")
        return result
    }

    /**
     * The GetColorKey method retrieves the source color key currently set for this stream.
     * @returns {DDCOLORKEY} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-ddcolorkey">DDCOLORKEY</a> structure that receives the source color key.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrvideostreamcontrol-getcolorkey
     */
    GetColorKey() {
        lpClrKey := DDCOLORKEY()
        result := ComCall(4, this, "ptr", lpClrKey, "HRESULT")
        return lpClrKey
    }

    /**
     * The SetStreamActiveState method activates or inactivates an input stream.
     * @param {BOOL} fActive Specifies the state of the stream. <b>TRUE</b> means active; <b>FALSE</b> means inactive.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrvideostreamcontrol-setstreamactivestate
     */
    SetStreamActiveState(fActive) {
        result := ComCall(5, this, "int", fActive, "HRESULT")
        return result
    }

    /**
     * The GetStreamActiveState method retrieves the state of the stream.
     * @returns {BOOL} Receives the current state of the stream. <b>TRUE</b> means the stream is active; <b>FALSE</b> means that it is inactive.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrvideostreamcontrol-getstreamactivestate
     */
    GetStreamActiveState() {
        result := ComCall(6, this, "int*", &lpfActive := 0, "HRESULT")
        return lpfActive
    }
}
