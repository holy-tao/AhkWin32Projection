#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXChorus extends IUnknown{
    /**
     * The interface identifier for IDirectSoundFXChorus
     * @type {Guid}
     */
    static IID => Guid("{880842e3-145f-43e6-a934-a71806e50547}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSFXChorus>} pcDsFxChorus 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxChorus) {
        result := ComCall(3, this, "ptr", pcDsFxChorus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSFXChorus>} pDsFxChorus 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxChorus) {
        result := ComCall(4, this, "ptr", pDsFxChorus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
