#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SENSORPROFILEID.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes a media foundation sensor profile.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorProfile extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProfileId", "AddProfileFilter", "IsMediaTypeSupported", "AddBlockedControl"]

    /**
     * 
     * @returns {SENSORPROFILEID} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-getprofileid
     */
    GetProfileId() {
        pId := SENSORPROFILEID()
        result := ComCall(3, this, "ptr", pId, "HRESULT")
        return pId
    }

    /**
     * 
     * @param {Integer} StreamId 
     * @param {PWSTR} wzFilterSetString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-addprofilefilter
     */
    AddProfileFilter(StreamId, wzFilterSetString) {
        wzFilterSetString := wzFilterSetString is String ? StrPtr(wzFilterSetString) : wzFilterSetString

        result := ComCall(4, this, "uint", StreamId, "ptr", wzFilterSetString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StreamId 
     * @param {IMFMediaType} pMediaType 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-ismediatypesupported
     */
    IsMediaTypeSupported(StreamId, pMediaType) {
        result := ComCall(5, this, "uint", StreamId, "ptr", pMediaType, "int*", &pfSupported := 0, "HRESULT")
        return pfSupported
    }

    /**
     * 
     * @param {PWSTR} wzBlockedControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofile-addblockedcontrol
     */
    AddBlockedControl(wzBlockedControl) {
        wzBlockedControl := wzBlockedControl is String ? StrPtr(wzBlockedControl) : wzBlockedControl

        result := ComCall(6, this, "ptr", wzBlockedControl, "HRESULT")
        return result
    }
}
