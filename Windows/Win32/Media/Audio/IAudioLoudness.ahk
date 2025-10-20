#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioLoudness interface provides access to a &quot;loudness&quot; compensation control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudioloudness
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioLoudness extends IUnknown{
    /**
     * The interface identifier for IAudioLoudness
     * @type {Guid}
     */
    static IID => Guid("{7d8b1437-dd53-4350-9c1b-1ee2890bd938}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    GetEnabled(pbEnabled) {
        result := ComCall(3, this, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bEnable 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    SetEnabled(bEnable, pguidEventContext) {
        result := ComCall(4, this, "int", bEnable, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
