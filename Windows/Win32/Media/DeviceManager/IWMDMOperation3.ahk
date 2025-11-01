#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMOperation.ahk

/**
 * The optional, application-implemented IWMDMOperation3 interface extends IWMDMOperation by providing a new method for transferring data unencrypted for added efficiency.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmoperation3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMOperation3 extends IWMDMOperation{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMOperation3
     * @type {Guid}
     */
    static IID => Guid("{d1f9b46a-9ca8-46d8-9d0f-1ec9bae54919}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferObjectDataOnClearChannel"]

    /**
     * 
     * @param {Pointer<Integer>} pData 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation3-transferobjectdataonclearchannel
     */
    TransferObjectDataOnClearChannel(pData, pdwSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
