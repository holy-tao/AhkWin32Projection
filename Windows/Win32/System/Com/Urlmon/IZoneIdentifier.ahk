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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result := ComCall(3, this, "uint*", &pdwZone := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(dwZone) {
        result := ComCall(4, this, "uint", dwZone, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creating, Altering, and Removing Views
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
