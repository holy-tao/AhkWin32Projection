#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMOperation.ahk

/**
 * The optional, application-implemented IWMDMOperation3 interface extends IWMDMOperation by providing a new method for transferring data unencrypted for added efficiency.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmoperation3
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
     * The TransferObjectDataOnClearChannel method is a more efficient implementation of IWMDMOperation::TransferObjectData.
     * @remarks
     * If the application supports this method, it is called in preference to the <b>TransferObjectData</b>.
     * 
     * See <b>TransferObjectData</b> to learn about the basics of this function. The difference between this method and <b>TransferObjectData</b> is that this method does not require the sender or receiver to encrypt or decrypt data, which requires extra processing time. Licensed content can still be sent using this method, since the content is always encrypted during transport anyway.
     * 
     * If the application supports this method, it is called in preference to the <b>TransferObjectData</b>.
     * @param {Pointer<Integer>} pData Pointer to an unencrypted byte buffer.
     * @param {Pointer<Integer>} pdwSize Pointer to a variable specifying the buffer size.
     * @returns {HRESULT} The application should return one of the following <b>HRESULT</b> values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should continue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WMDM_E_USER_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred, and the read operation should be cancelled without finishing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmoperation3-transferobjectdataonclearchannel
     */
    TransferObjectDataOnClearChannel(pData, pdwSize) {
        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pDataMarshal, pData, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
