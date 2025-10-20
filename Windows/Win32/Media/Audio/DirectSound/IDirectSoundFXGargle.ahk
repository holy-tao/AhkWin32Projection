#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXGargle extends IUnknown{
    /**
     * The interface identifier for IDirectSoundFXGargle
     * @type {Guid}
     */
    static IID => Guid("{d616f352-d622-11ce-aac5-0020af0b99a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DSFXGargle>} pcDsFxGargle 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxGargle) {
        result := ComCall(3, this, "ptr", pcDsFxGargle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DSFXGargle>} pDsFxGargle 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxGargle) {
        result := ComCall(4, this, "ptr", pDsFxGargle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
