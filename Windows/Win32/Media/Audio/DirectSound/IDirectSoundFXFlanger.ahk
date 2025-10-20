#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXFlanger extends IUnknown{
    /**
     * The interface identifier for IDirectSoundFXFlanger
     * @type {Guid}
     */
    static IID => Guid("{903e9878-2c92-4072-9b2c-ea68f5396783}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSFXFlanger>} pcDsFxFlanger 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxFlanger) {
        result := ComCall(3, this, "ptr", pcDsFxFlanger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSFXFlanger>} pDsFxFlanger 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxFlanger) {
        result := ComCall(4, this, "ptr", pDsFxFlanger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
