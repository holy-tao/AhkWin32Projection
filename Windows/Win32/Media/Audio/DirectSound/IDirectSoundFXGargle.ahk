#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSFXGargle.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXGargle extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAllParameters", "GetAllParameters"]

    /**
     * 
     * @param {Pointer<DSFXGargle>} pcDsFxGargle 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxGargle) {
        result := ComCall(3, this, "ptr", pcDsFxGargle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXGargle} 
     */
    GetAllParameters() {
        pDsFxGargle := DSFXGargle()
        result := ComCall(4, this, "ptr", pDsFxGargle, "HRESULT")
        return pDsFxGargle
    }
}
