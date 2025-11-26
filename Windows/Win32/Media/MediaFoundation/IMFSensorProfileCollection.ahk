#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSensorProfile.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains a collection of media foundation sensor profile objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorprofilecollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorProfileCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorProfileCollection
     * @type {Guid}
     */
    static IID => Guid("{c95ea55b-0187-48be-9353-8d2507662351}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProfileCount", "GetProfile", "AddProfile", "FindProfile", "RemoveProfileByIndex", "RemoveProfile"]

    /**
     * 
     * @returns {Integer} 
     */
    GetProfileCount() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * Retrieves the specified profile.
     * @param {Integer} Index Index of the profile to retrieve.
     * @returns {IMFSensorProfile} On success, returns a double pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> object that describes the specified sensor profile.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofilecollection-getprofile
     */
    GetProfile(Index) {
        result := ComCall(4, this, "uint", Index, "ptr*", &ppProfile := 0, "HRESULT")
        return IMFSensorProfile(ppProfile)
    }

    /**
     * Adds the specified profile to the collection.
     * @param {IMFSensorProfile} pProfile Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorprofile">IMFSensorProfile</a> object describing the profile to add.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofilecollection-addprofile
     */
    AddProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * Finds a profile based on the specified profile ID.
     * @param {Pointer<SENSORPROFILEID>} ProfileId Pointer to the The ID of the profile to find.
     * @returns {IMFSensorProfile} On success, returns a double pointer to the profile.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofilecollection-findprofile
     */
    FindProfile(ProfileId) {
        result := ComCall(6, this, "ptr", ProfileId, "ptr*", &ppProfile := 0, "HRESULT")
        return IMFSensorProfile(ppProfile)
    }

    /**
     * Removes a profile based on the specified index.
     * @param {Integer} Index The index of the profile to remove.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofilecollection-removeprofilebyindex
     */
    RemoveProfileByIndex(Index) {
        ComCall(7, this, "uint", Index)
    }

    /**
     * Removes the specified profile based on the specified profile ID.
     * @param {Pointer<SENSORPROFILEID>} ProfileId Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ns-mfidl-sensorprofileid">SENSORPROFILEID</a> of the profile to remove.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorprofilecollection-removeprofile
     */
    RemoveProfile(ProfileId) {
        ComCall(8, this, "ptr", ProfileId)
    }
}
