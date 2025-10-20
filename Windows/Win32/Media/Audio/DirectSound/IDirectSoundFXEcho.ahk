#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXEcho extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundFXEcho
     * @type {Guid}
     */
    static IID => Guid("{8bd28edf-50db-4e92-a2bd-445488d1ed42}")

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
     * @param {Pointer<DSFXEcho>} pcDsFxEcho 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxEcho) {
        result := ComCall(3, this, "ptr", pcDsFxEcho, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DSFXEcho>} pDsFxEcho 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxEcho) {
        result := ComCall(4, this, "ptr", pDsFxEcho, "HRESULT")
        return result
    }
}
