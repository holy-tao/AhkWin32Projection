#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPDirectTransfer interface enables Windows Media Device Manager to delegate content transfer to the service provider.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-imdspdirecttransfer
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDirectTransfer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDirectTransfer
     * @type {Guid}
     */
    static IID => Guid("{c2fe57a8-9304-478c-9ee4-47e397b912d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferToDevice"]

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
}
