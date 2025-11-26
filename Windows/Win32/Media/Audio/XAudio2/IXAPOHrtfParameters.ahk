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
     * Sets the position of the sound relative to the listener.
     * @param {Pointer<HrtfPosition>} position The position of the sound relative to the listener.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceposition
     */
    SetSourcePosition(position) {
        result := ComCall(3, this, "ptr", position, "HRESULT")
        return result
    }

    /**
     * Set the rotation matrix for the source orientation, with respect to the listener's coordinate system.
     * @param {Pointer<HrtfOrientation>} orientation The rotation matrix for the source orientation, with respect to the listener's frame of reference.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourceorientation
     */
    SetSourceOrientation(orientation) {
        result := ComCall(4, this, "ptr", orientation, "HRESULT")
        return result
    }

    /**
     * Sets the custom direct-path gain value for the current source position. Valid only for sounds played with the HrtfDistanceDecayType custom decay type.
     * @param {Float} gain The custom direct-path gain value for the current source position in dB. Valid only for sounds played with the HrtfDistanceDecayType custom decay type.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setsourcegain
     */
    SetSourceGain(gain) {
        result := ComCall(5, this, "float", gain, "HRESULT")
        return result
    }

    /**
     * Selects the acoustic environment to simulate.
     * @param {Integer} environment The acoustic environment to simulate.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/nf-hrtfapoapi-ixapohrtfparameters-setenvironment
     */
    SetEnvironment(environment) {
        result := ComCall(6, this, "int", environment, "HRESULT")
        return result
    }
}
