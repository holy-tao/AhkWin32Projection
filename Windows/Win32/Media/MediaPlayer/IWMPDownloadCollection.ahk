#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPDownloadItem2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadCollection
     * @type {Guid}
     */
    static IID => Guid("{0a319c7f-85f9-436c-b88e-82fd88000e1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_id", "get_count", "item", "startDownload", "removeItem", "Clear"]

    /**
     */
    id {
        get => this.get_id()
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * 
     * @param {Pointer<Integer>} plId 
     * @returns {HRESULT} 
     */
    get_id(plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lItem 
     * @returns {IWMPDownloadItem2} 
     */
    item(lItem) {
        result := ComCall(9, this, "int", lItem, "ptr*", &ppDownload := 0, "HRESULT")
        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {BSTR} bstrSourceURL 
     * @param {BSTR} bstrType 
     * @returns {IWMPDownloadItem2} 
     */
    startDownload(bstrSourceURL, bstrType) {
        bstrSourceURL := bstrSourceURL is String ? BSTR.Alloc(bstrSourceURL).Value : bstrSourceURL
        bstrType := bstrType is String ? BSTR.Alloc(bstrType).Value : bstrType

        result := ComCall(10, this, "ptr", bstrSourceURL, "ptr", bstrType, "ptr*", &ppDownload := 0, "HRESULT")
        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {Integer} lItem 
     * @returns {HRESULT} 
     */
    removeItem(lItem) {
        result := ComCall(11, this, "int", lItem, "HRESULT")
        return result
    }

    /**
     * Resets the TPM to its factory-default state.
     * @remarks
     * Running this method can help prepare a TPM-equipped computer for recycling.
     * 
     * To clear the TPM but no longer have the TPM owner authorization, you need physical access to the computer. The [**SetPhysicalPresenceRequest**](setphysicalpresencerequest-win32-tpm.md) method includes functionality to help clear the TPM without TPM owner authorization.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * The following table lists some of the common return codes.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                         | Description                                                                                                                                                                          |
     * |-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                         | The method was successful.<br/>                                                                                                                                                |
     * | <dl> <dt>**TPM\_E\_AUTHFAIL**</dt> <dt>2150105089 (0x80280001)</dt> </dl>              | The provided owner authorization value cannot perform the request.<br/>                                                                                                        |
     * | <dl> <dt>**TPM\_E\_DEFEND\_LOCK\_RUNNING**</dt> <dt>2150107139 (0x80280803)</dt> </dl> | The TPM is defending against dictionary attacks and is in a time-out period. For more information, see the [**ResetAuthLockOut**](resetauthlockout-win32-tpm.md) method.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/clear-win32-tpm
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
