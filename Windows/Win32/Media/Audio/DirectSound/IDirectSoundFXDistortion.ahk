#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXDistortion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundFXDistortion
     * @type {Guid}
     */
    static IID => Guid("{8ecf4326-455f-4d8b-bda9-8d5d3e9e3e0b}")

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
     * @param {Pointer<DSFXDistortion>} pcDsFxDistortion 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxDistortion) {
        result := ComCall(3, this, "ptr", pcDsFxDistortion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DSFXDistortion>} pDsFxDistortion 
     * @returns {HRESULT} 
     */
    GetAllParameters(pDsFxDistortion) {
        result := ComCall(4, this, "ptr", pDsFxDistortion, "HRESULT")
        return result
    }
}
