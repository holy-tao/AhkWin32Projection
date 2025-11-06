#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSFXParamEq.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundFXParamEq extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundFXParamEq
     * @type {Guid}
     */
    static IID => Guid("{c03ca9fe-fe90-4204-8078-82334cd177da}")

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
     * @param {Pointer<DSFXParamEq>} pcDsFxParamEq 
     * @returns {HRESULT} 
     */
    SetAllParameters(pcDsFxParamEq) {
        result := ComCall(3, this, "ptr", pcDsFxParamEq, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DSFXParamEq} 
     */
    GetAllParameters() {
        pDsFxParamEq := DSFXParamEq()
        result := ComCall(4, this, "ptr", pDsFxParamEq, "HRESULT")
        return pDsFxParamEq
    }
}
