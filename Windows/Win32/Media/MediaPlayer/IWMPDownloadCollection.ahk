#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPDownloadItem2.ahk" { IWMPDownloadItem2 }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPDownloadCollection extends IDispatch {
    /**
     * The interface identifier for IWMPDownloadCollection
     * @type {Guid}
     */
    static IID := Guid("{0a319c7f-85f9-436c-b88e-82fd88000e1c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPDownloadCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_id        : IntPtr
        get_count     : IntPtr
        item          : IntPtr
        startDownload : IntPtr
        removeItem    : IntPtr
        Clear         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPDownloadCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Integer} _lItem 
     * @returns {IWMPDownloadItem2} 
     */
    item(_lItem) {
        result := ComCall(9, this, "int", _lItem, "ptr*", &ppDownload := 0, "HRESULT")
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

        result := ComCall(10, this, BSTR, bstrSourceURL, BSTR, bstrType, "ptr*", &ppDownload := 0, "HRESULT")
        return IWMPDownloadItem2(ppDownload)
    }

    /**
     * 
     * @param {Integer} _lItem 
     * @returns {HRESULT} 
     */
    removeItem(_lItem) {
        result := ComCall(11, this, "int", _lItem, "HRESULT")
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

    Query(iid) {
        if (IWMPDownloadCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_id := CallbackCreate(GetMethod(implObj, "get_id"), flags, 2)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.startDownload := CallbackCreate(GetMethod(implObj, "startDownload"), flags, 4)
        this.vtbl.removeItem := CallbackCreate(GetMethod(implObj, "removeItem"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_id)
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.startDownload)
        CallbackFree(this.vtbl.removeItem)
        CallbackFree(this.vtbl.Clear)
    }
}
