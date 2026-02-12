#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnhancedStorageACT.ahk

/**
 * IEnhancedStorageACT2 interface is used to obtain information for a 1667 Addressable Contact Target (ACT).
 * @see https://learn.microsoft.com/windows/win32/api//content/ehstorapi/nn-ehstorapi-ienhancedstorageact2
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageACT2 extends IEnhancedStorageACT{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageACT2
     * @type {Guid}
     */
    static IID => Guid("{4da57d2e-8eb3-41f6-a07e-98b52b88242b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceName", "IsDeviceRemovable"]

    /**
     * IEnhancedStorageACT2::GetDeviceName method returns the device name associated with the Addressable Command Target (ACT).
     * @remarks
     * The memory containing the device name string is allocated by the Enhanced Storage API and must be freed by passing the returned pointer to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {PWSTR} Pointer to a string that represents the device name associated with the ACT.
     * @see https://learn.microsoft.com/windows/win32/api//content/ehstorapi/nf-ehstorapi-ienhancedstorageact2-getdevicename
     */
    GetDeviceName() {
        result := ComCall(9, this, "ptr*", &ppwszDeviceName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppwszDeviceName
    }

    /**
     * IEnhancedStorageACT2::IsDeviceRemovable method returns information that indicates if the device associated with the ACT is removable.
     * @returns {BOOL} Pointer to a boolean value that indicates if the device associated with the ACT is removable.
     * @see https://learn.microsoft.com/windows/win32/api//content/ehstorapi/nf-ehstorapi-ienhancedstorageact2-isdeviceremovable
     */
    IsDeviceRemovable() {
        result := ComCall(10, this, "int*", &pIsDeviceRemovable := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pIsDeviceRemovable
    }
}
