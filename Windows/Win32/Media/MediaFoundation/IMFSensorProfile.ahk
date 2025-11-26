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
     * Retrieves the sensor profile ID.
     * @returns {SENSORPROFILEID} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid">SENSORPROFILEID</a> containing the profile ID.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofile-getprofileid
     */
    GetProfileId() {
        pId := SENSORPROFILEID()
        result := ComCall(3, this, "ptr", pId, "HRESULT")
        return pId
    }

    /**
     * Adds a profile filter to the specified media stream.
     * @param {Integer} StreamId The ID of the stream to add to.
     * @param {PWSTR} wzFilterSetString The filter to add.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofile-addprofilefilter
     */
    AddProfileFilter(StreamId, wzFilterSetString) {
        wzFilterSetString := wzFilterSetString is String ? StrPtr(wzFilterSetString) : wzFilterSetString

        result := ComCall(4, this, "uint", StreamId, "ptr", wzFilterSetString, "HRESULT")
        return result
    }

    /**
     * Determines if a media stream supports the specified media type.
     * @param {Integer} StreamId The ID of the stream to check.
     * @param {IMFMediaType} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> describing the media type to check.
     * @returns {BOOL} Returns <b>true</b> if the media type is supported; otherwise, <b>false</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofile-ismediatypesupported
     */
    IsMediaTypeSupported(StreamId, pMediaType) {
        result := ComCall(5, this, "uint", StreamId, "ptr", pMediaType, "int*", &pfSupported := 0, "HRESULT")
        return pfSupported
    }

    /**
     * Adds the specified blocked control .
     * @param {PWSTR} wzBlockedControl The blocked control to add.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofile-addblockedcontrol
     */
    AddBlockedControl(wzBlockedControl) {
        wzBlockedControl := wzBlockedControl is String ? StrPtr(wzBlockedControl) : wzBlockedControl

        result := ComCall(6, this, "ptr", wzBlockedControl, "HRESULT")
        return result
    }
}
