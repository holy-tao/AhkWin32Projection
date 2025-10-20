#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRAspectRatioControl interface controls whether the Video Mixing Renderer Filter 7 (VMR-7) preserves the aspect ratio of the source video.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmraspectratiocontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRAspectRatioControl extends IUnknown{
    /**
     * The interface identifier for IVMRAspectRatioControl
     * @type {Guid}
     */
    static IID => Guid("{ede80b5c-bad6-4623-b537-65586c9f8dfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} lpdwARMode 
     * @returns {HRESULT} 
     */
    GetAspectRatioMode(lpdwARMode) {
        result := ComCall(3, this, "uint*", lpdwARMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwARMode 
     * @returns {HRESULT} 
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
