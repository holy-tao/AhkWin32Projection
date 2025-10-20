#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the transcode profile object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftranscodeprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTranscodeProfile extends IUnknown{
    /**
     * The interface identifier for IMFTranscodeProfile
     * @type {Guid}
     */
    static IID => Guid("{4adfdba3-7ab0-4953-a62b-461e7ff3da1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttrs 
     * @returns {HRESULT} 
     */
    SetAudioAttributes(pAttrs) {
        result := ComCall(3, this, "ptr", pAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttrs 
     * @returns {HRESULT} 
     */
    GetAudioAttributes(ppAttrs) {
        result := ComCall(4, this, "ptr", ppAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttrs 
     * @returns {HRESULT} 
     */
    SetVideoAttributes(pAttrs) {
        result := ComCall(5, this, "ptr", pAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttrs 
     * @returns {HRESULT} 
     */
    GetVideoAttributes(ppAttrs) {
        result := ComCall(6, this, "ptr", ppAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} pAttrs 
     * @returns {HRESULT} 
     */
    SetContainerAttributes(pAttrs) {
        result := ComCall(7, this, "ptr", pAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttrs 
     * @returns {HRESULT} 
     */
    GetContainerAttributes(ppAttrs) {
        result := ComCall(8, this, "ptr", ppAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
