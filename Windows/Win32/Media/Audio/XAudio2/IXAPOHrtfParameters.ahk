#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The interface used to set parameters that control how head-related transfer function (HRTF) is applied to a sound.
 * @remarks
 * 
 * Create instances of the XAPO interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/hrtfapoapi/nf-hrtfapoapi-createhrtfapo">CreateHrtfApo</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nn-hrtfapoapi-ixapohrtfparameters
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class IXAPOHrtfParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXAPOHrtfParameters
     * @type {Guid}
     */
    static IID => Guid("{15b3cd66-e9de-4464-b6e6-2bc3cf63d455}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSourcePosition", "SetSourceOrientation", "SetSourceGain", "SetEnvironment"]

    /**
     * 
     * @param {Pointer<HrtfPosition>} position 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceposition
     */
    SetSourcePosition(position) {
        result := ComCall(3, this, "ptr", position, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HrtfOrientation>} orientation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceorientation
     */
    SetSourceOrientation(orientation) {
        result := ComCall(4, this, "ptr", orientation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourcegain
     */
    SetSourceGain(gain) {
        result := ComCall(5, this, "float", gain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} environment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setenvironment
     */
    SetEnvironment(environment) {
        result := ComCall(6, this, "int", environment, "HRESULT")
        return result
    }
}
