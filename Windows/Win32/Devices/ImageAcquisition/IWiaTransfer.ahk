#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWIA_FORMAT_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaTransfer interface provides stream-based transfer of data.
 * @remarks
 * The **IWiaTransfer** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaTransfer** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The **IWiaTransfer** interface, like all Component Object Model (COM) interfaces, inherits the [IUnknown](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface methods.
 * 
 * 
 * 
 * | IUnknown Methods                                        | Description                               |
 * |---------------------------------------------------------|-------------------------------------------|
 * | [IUnknown::QueryInterface](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) | Returns pointers to supported interfaces. |
 * | [IUnknown::AddRef](/windows/win32/api/unknwn/nf-unknwn-iunknown-addref)                 | Increments reference count.               |
 * | [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release)               | Decrements reference count.               |
 * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiatransfer
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransfer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaTransfer
     * @type {Guid}
     */
    static IID => Guid("{c39d6942-2f4e-4d04-92fe-4ef4d3a1de5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Download", "Upload", "Cancel", "EnumWIA_FORMAT_INFO"]

    /**
     * Initiates a data download to the caller.
     * @remarks
     * If a folder is downloaded, then all the child items of that folder are also transferred. Each item is transferred in a separate stream.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IWiaTransferCallback} pIWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the caller's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiatransfer-download
     */
    Download(lFlags, pIWiaTransferCallback) {
        result := ComCall(3, this, "int", lFlags, "ptr", pIWiaTransferCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a data upload of a single item from the caller.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Currently unused. Should be set to zero.
     * @param {IStream} pSource Type: **[IStream](/windows/win32/api/objidl/nn-objidl-istream)\***
     * 
     * Specifies a pointer to the [IStream](/windows/win32/api/objidl/nn-objidl-istream) data.
     * @param {IWiaTransferCallback} pIWiaTransferCallback Type: **[**IWiaTransferCallback**](-wia-iwiatransfercallback.md)\***
     * 
     * Specifies a pointer to the caller's [**IWiaTransferCallback**](-wia-iwiatransfercallback.md) interface.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiatransfer-upload
     */
    Upload(lFlags, pSource, pIWiaTransferCallback) {
        result := ComCall(4, this, "int", lFlags, "ptr", pSource, "ptr", pIWiaTransferCallback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancels the current transfer operation.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiatransfer-cancel
     */
    Cancel() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an enumerator for the transfer formats that the Windows Image Acquisition (WIA) 2.0 device supports.
     * @remarks
     * Applications must call the [IUnknown::Release](/windows/win32/api/unknwn/nf-unknwn-iunknown-release) method on the interface pointer received through the *ppIEnum* parameter.
     * @returns {IEnumWIA_FORMAT_INFO} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-iwiatransfer-enumwia-format-info
     */
    EnumWIA_FORMAT_INFO() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumWIA_FORMAT_INFO(ppEnum)
    }
}
