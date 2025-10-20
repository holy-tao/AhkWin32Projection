#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRVideoStreamControl interface is implemented on each input pin of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrvideostreamcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRVideoStreamControl extends IUnknown{
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
     * 
     * @param {Pointer<DDCOLORKEY>} lpClrKey 
     * @returns {HRESULT} 
     */
    SetColorKey(lpClrKey) {
        result := ComCall(3, this, "ptr", lpClrKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORKEY>} lpClrKey 
     * @returns {HRESULT} 
     */
    GetColorKey(lpClrKey) {
        result := ComCall(4, this, "ptr", lpClrKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fActive 
     * @returns {HRESULT} 
     */
    SetStreamActiveState(fActive) {
        result := ComCall(5, this, "int", fActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} lpfActive 
     * @returns {HRESULT} 
     */
    GetStreamActiveState(lpfActive) {
        result := ComCall(6, this, "ptr", lpfActive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
