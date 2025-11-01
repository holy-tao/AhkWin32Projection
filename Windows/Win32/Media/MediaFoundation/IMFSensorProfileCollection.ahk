#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} Index 
     * @param {Pointer<IMFSensorProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-getprofile
     */
    GetProfile(Index, ppProfile) {
        result := ComCall(4, this, "uint", Index, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFSensorProfile} pProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-addprofile
     */
    AddProfile(pProfile) {
        result := ComCall(5, this, "ptr", pProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SENSORPROFILEID>} ProfileId 
     * @param {Pointer<IMFSensorProfile>} ppProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-findprofile
     */
    FindProfile(ProfileId, ppProfile) {
        result := ComCall(6, this, "ptr", ProfileId, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-removeprofilebyindex
     */
    RemoveProfileByIndex(Index) {
        ComCall(7, this, "uint", Index)
    }

    /**
     * 
     * @param {Pointer<SENSORPROFILEID>} ProfileId 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorprofilecollection-removeprofile
     */
    RemoveProfile(ProfileId) {
        ComCall(8, this, "ptr", ProfileId)
    }
}
