#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPropertyKeyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyKeyStore
     * @type {Guid}
     */
    static IID => Guid("{75bd59aa-f23b-4963-aba4-0b355752a91b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKeyCount", "GetKeyAt", "AppendKey", "DeleteKey", "IsKeyInStore", "RemoveKey"]

    /**
     * 
     * @returns {Integer} 
     */
    GetKeyCount() {
        result := ComCall(3, this, "int*", &keyCount := 0, "HRESULT")
        return keyCount
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {PROPERTYKEY} 
     */
    GetKeyAt(index) {
        pkey := PROPERTYKEY()
        result := ComCall(4, this, "int", index, "ptr", pkey, "HRESULT")
        return pkey
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    AppendKey(key) {
        result := ComCall(5, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * Deletes a given key protector for the volume.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} index 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                          | Description                                                                                                                                                                                                                                                                                                               |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                          | The method was successful.<br/>                                                                                                                                                                                                                                                                                     |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl>         | The volume is locked.<br/>                                                                                                                                                                                                                                                                                          |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl>         | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                                                                                                                                                                                                                              |
     * | <dl> <dt>**E\_INVALIDARG**</dt> <dt>2147942487 (0x80070057)</dt> </dl>                  | The *VolumeKeyProtectorID* parameter does not refer to a valid key protector.<br/>                                                                                                                                                                                                                                  |
     * | <dl> <dt>**FVE\_E\_KEY\_REQUIRED**</dt> <dt>2150694941 (0x8031001D)</dt> </dl>          | The last key protector for a partially or fully encrypted volume cannot be removed if key protectors are enabled. Use [**DisableKeyProtectors**](disablekeyprotectors-win32-encryptablevolume.md) before removing this last key protector to ensure that encrypted portions of the volume remain accessible. <br/> |
     * | <dl> <dt>**FVE\_E\_VOLUME\_BOUND\_ALREADY**</dt> <dt>2150694943 (0x8031001F)</dt> </dl> | This key protector cannot be deleted because it is being used to automatically unlock the volume. <br/> Use [**DisableAutoUnlock**](disableautounlock-win32-encryptablevolume.md) to disable automatic unlocking before deleting this key protector.<br/>                                                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/deletekeyprotector-win32-encryptablevolume
     */
    DeleteKey(index) {
        result := ComCall(6, this, "int", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    IsKeyInStore(key) {
        result := ComCall(7, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    RemoveKey(key) {
        result := ComCall(8, this, "ptr", key, "HRESULT")
        return result
    }
}
