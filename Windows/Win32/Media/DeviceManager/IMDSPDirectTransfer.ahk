#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPDirectTransfer interface enables Windows Media Device Manager to delegate content transfer to the service provider.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdirecttransfer
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDirectTransfer extends IUnknown{
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
     * 
     * @param {PWSTR} pwszSourceFilePath 
     * @param {Pointer<IWMDMOperation>} pSourceOperation 
     * @param {Integer} fuFlags 
     * @param {PWSTR} pwszDestinationName 
     * @param {Pointer<IWMDMMetaData>} pSourceMetaData 
     * @param {Pointer<IWMDMProgress>} pTransferProgress 
     * @param {Pointer<IMDSPStorage>} ppNewObject 
     * @returns {HRESULT} 
     */
    TransferToDevice(pwszSourceFilePath, pSourceOperation, fuFlags, pwszDestinationName, pSourceMetaData, pTransferProgress, ppNewObject) {
        pwszSourceFilePath := pwszSourceFilePath is String ? StrPtr(pwszSourceFilePath) : pwszSourceFilePath
        pwszDestinationName := pwszDestinationName is String ? StrPtr(pwszDestinationName) : pwszDestinationName

        result := ComCall(3, this, "ptr", pwszSourceFilePath, "ptr", pSourceOperation, "uint", fuFlags, "ptr", pwszDestinationName, "ptr", pSourceMetaData, "ptr", pTransferProgress, "ptr", ppNewObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
