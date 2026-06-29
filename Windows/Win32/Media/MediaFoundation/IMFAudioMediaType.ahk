#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * IMFAudioMediaType is no longer available for use as of Windows 7.
 * @remarks
 * <b>Windows Server 2008 and Windows Vista:  </b>If the major type of a media type is <b>MFMediaType_Audio</b>, you can query the media type object for the <b>IMFAudioMediaType</b> interface.
 * 
 * To convert an audio media type into a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype">MFCreateWaveFormatExFromMFMediaType</a>.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfaudiomediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFAudioMediaType extends IMFMediaType {
    /**
     * The interface identifier for IMFAudioMediaType
     * @type {Guid}
     */
    static IID := Guid("{26a0adc3-ce26-4672-9304-69552edd3faf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFAudioMediaType interfaces
    */
    struct Vtbl extends IMFMediaType.Vtbl {
        GetAudioFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFAudioMediaType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetAudioFormat is no longer available for use as of Windows 7.
     * @remarks
     * If you need to convert the media type into a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatewaveformatexfrommfmediatype">MFCreateWaveFormatExFromMFMediaType</a>.
     * 
     * There are no guarantees about how long the returned pointer is valid.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Pointer<WAVEFORMATEX>} This method returns a pointer to a <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfaudiomediatype-getaudioformat
     */
    GetAudioFormat() {
        result := ComCall(38, this, WAVEFORMATEX.Ptr)
        return result
    }

    Query(iid) {
        if (IMFAudioMediaType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAudioFormat := CallbackCreate(GetMethod(implObj, "GetAudioFormat"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAudioFormat)
    }
}
