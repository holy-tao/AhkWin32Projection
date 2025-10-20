#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXCompressor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundFXCompressor
     * @type {Guid}
     */
    static IID => Guid("{4bbd1154-62f6-4e2c-a15c-d3b6c417f7a0}")

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
     * @param {Pointer<DSFXCompressor>} pcDsFxCompressor 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxCompressor) {
        result := ComCall(3, this, "ptr", pcDsFxCompressor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DSFXCompressor>} pDsFxCompressor 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxCompressor) {
        result := ComCall(4, this, "ptr", pDsFxCompressor, "HRESULT")
        return result
    }
}
