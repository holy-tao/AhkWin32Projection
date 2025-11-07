#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the transcode profile object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftranscodeprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTranscodeProfile extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioAttributes", "GetAudioAttributes", "SetVideoAttributes", "GetVideoAttributes", "SetContainerAttributes", "GetContainerAttributes"]

    /**
     * 
     * @param {IMFAttributes} pAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes
     */
    SetAudioAttributes(pAttrs) {
        result := ComCall(3, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getaudioattributes
     */
    GetAudioAttributes() {
        result := ComCall(4, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }

    /**
     * 
     * @param {IMFAttributes} pAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes
     */
    SetVideoAttributes(pAttrs) {
        result := ComCall(5, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getvideoattributes
     */
    GetVideoAttributes() {
        result := ComCall(6, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }

    /**
     * 
     * @param {IMFAttributes} pAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setcontainerattributes
     */
    SetContainerAttributes(pAttrs) {
        result := ComCall(7, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getcontainerattributes
     */
    GetContainerAttributes() {
        result := ComCall(8, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }
}
