#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IZoneIdentifier extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IZoneIdentifier
     * @type {Guid}
     */
    static IID => Guid("{cd45f185-1b21-48e2-967b-ead743a8914e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "SetId", "Remove"]

    /**
     * Returns the identifier string available in the volume's metadata.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result := ComCall(3, this, "uint*", &pdwZone := 0, "HRESULT")
        return pdwZone
    }

    /**
     * Sets the specified identifier string in the volume's metadata.
     * @param {Integer} dwZone 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/>                                                                           |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | This drive is locked by BitLocker Drive Encryption. You must unlock this volume from Control Panel. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl> | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(dwZone) {
        result := ComCall(4, this, "uint", dwZone, "HRESULT")
        return result
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
