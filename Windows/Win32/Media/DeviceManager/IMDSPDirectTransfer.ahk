#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDMProgress.ahk" { IWMDMProgress }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWMDMMetaData.ahk" { IWMDMMetaData }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMDSPStorage.ahk" { IMDSPStorage }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWMDMOperation.ahk" { IWMDMOperation }

/**
 * The IMDSPDirectTransfer interface enables Windows Media Device Manager to delegate content transfer to the service provider.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspdirecttransfer
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct IMDSPDirectTransfer extends IUnknown {
    /**
     * The interface identifier for IMDSPDirectTransfer
     * @type {Guid}
     */
    static IID := Guid("{c2fe57a8-9304-478c-9ee4-47e397b912d7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMDSPDirectTransfer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        TransferToDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMDSPDirectTransfer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The TransferToDevice method is called by Windows Media Device Manager to delegate content transfer content to the service provider. The source can be specified either as a file or as an operation interface.
     * @remarks
     * Windows Media Device Manager queries for <b>IMDSPDirectTransfer</b> interface during every transfer.
     * 
     * If the service provider supports the <b>IMDSPDirectTransfer</b> interface, Windows Media Device Manager simply delegates content transfer to the service provider. In this case, Windows Media Device Manager does not do any processing of the content before sending it to the service provider. The service provider gets full control of the source.
     * 
     * If the service provider does not support the <b>IMDSPDirectTransfer</b> interface, Windows Media Device Manager processes the source files and sends byte packets to the service provider. In addition, for protected content, Windows Media Device Manager calls the secure content provider to process the content before sending it to the service provider.
     * 
     * If <b>IMDSPDirectTransfer</b> is supported, Windows Media Device Manager delegates handling of the content to the service provider. This provides flexibility to the service provider for handling the content. In this case, the service provider is responsible for handling the protected content.
     * @param {PWSTR} pwszSourceFilePath Source file name. The value contained in this parameter should be ignored if WMDM_CONTENT_OPERATIONINTERFACE is specified.
     * @param {IWMDMOperation} pSourceOperation Operation interface pointer that serves as the source. The value contained in this parameter should be ignored unless WMDM_CONTENT_OPERATIONINTERFACE is specified.
     * @param {Integer} fuFlags 
     * @param {PWSTR} pwszDestinationName Content should be transferred to the device with this name. This parameter is required.
     * @param {IWMDMMetaData} pSourceMetaData Metadata interface pointer. The metadata object contains the source properties. This parameter is optional.
     * @param {IWMDMProgress} pTransferProgress Progress callback interface. The service provider should update the information during the progress of the transfer. This parameter is optional.
     * @returns {IMDSPStorage} Newly created storage object. This parameter is optional. This can be <b>NULL</b> if the caller does not need to have the new object returned.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdirecttransfer-transfertodevice
     */
    TransferToDevice(pwszSourceFilePath, pSourceOperation, fuFlags, pwszDestinationName, pSourceMetaData, pTransferProgress) {
        pwszSourceFilePath := pwszSourceFilePath is String ? StrPtr(pwszSourceFilePath) : pwszSourceFilePath
        pwszDestinationName := pwszDestinationName is String ? StrPtr(pwszDestinationName) : pwszDestinationName

        result := ComCall(3, this, "ptr", pwszSourceFilePath, "ptr", pSourceOperation, "uint", fuFlags, "ptr", pwszDestinationName, "ptr", pSourceMetaData, "ptr", pTransferProgress, "ptr*", &ppNewObject := 0, "HRESULT")
        return IMDSPStorage(ppNewObject)
    }

    Query(iid) {
        if (IMDSPDirectTransfer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.TransferToDevice := CallbackCreate(GetMethod(implObj, "TransferToDevice"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.TransferToDevice)
    }
}
