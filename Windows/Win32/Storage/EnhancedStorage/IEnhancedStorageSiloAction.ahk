#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use this interface as a point of access for actions involving IEEE 1667 silos.
 * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nn-ehstorapi-ienhancedstoragesiloaction
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageSiloAction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageSiloAction
     * @type {Guid}
     */
    static IID => Guid("{b6f7f311-206f-4ff8-9c4b-27efee77a86f}")

    /**
     * The class identifier for EnhancedStorageSiloAction
     * @type {Guid}
     */
    static CLSID => Guid("{886d29dd-b506-466b-9fbf-b44ff383fb3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetDescription", "Invoke"]

    /**
     * Returns a string for the name of the action specified by the IEnhancedStorageSiloAction object.
     * @returns {PWSTR} Pointer to a string that represents the silo action by name.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppwszActionName := 0, "HRESULT")
        return ppwszActionName
    }

    /**
     * Returns a descriptive string for the action specified by the IEnhancedStorageSiloAction object.
     * @returns {PWSTR} Pointer to a string that describes the silo action.
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-getdescription
     */
    GetDescription() {
        result := ComCall(4, this, "ptr*", &ppwszActionDescription := 0, "HRESULT")
        return ppwszActionDescription
    }

    /**
     * Performs the action specified by an IEnhancedStorageSiloAction object.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The action was invoked successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ehstorapi/nf-ehstorapi-ienhancedstoragesiloaction-invoke
     */
    Invoke() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
