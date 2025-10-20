#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes a media foundation sensor profile.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorProfile extends IUnknown{
    /**
     * The interface identifier for IMFSensorProfile
     * @type {Guid}
     */
    static IID => Guid("{22f765d1-8dab-4107-846d-56baf72215e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SENSORPROFILEID>} pId 
     * @returns {HRESULT} 
     */
    GetProfileId(pId) {
        result := ComCall(3, this, "ptr", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamId 
     * @param {PWSTR} wzFilterSetString 
     * @returns {HRESULT} 
     */
    AddProfileFilter(StreamId, wzFilterSetString) {
        wzFilterSetString := wzFilterSetString is String ? StrPtr(wzFilterSetString) : wzFilterSetString

        result := ComCall(4, this, "uint", StreamId, "ptr", wzFilterSetString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamId 
     * @param {Pointer<IMFMediaType>} pMediaType 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsMediaTypeSupported(StreamId, pMediaType, pfSupported) {
        result := ComCall(5, this, "uint", StreamId, "ptr", pMediaType, "ptr", pfSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wzBlockedControl 
     * @returns {HRESULT} 
     */
    AddBlockedControl(wzBlockedControl) {
        wzBlockedControl := wzBlockedControl is String ? StrPtr(wzBlockedControl) : wzBlockedControl

        result := ComCall(6, this, "ptr", wzBlockedControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
