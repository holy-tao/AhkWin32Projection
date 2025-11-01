#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDMDevice2.ahk

/**
 * The IWMDMDevice3 interface extends IWMDMDevice2 by providing methods to query a device for properties, send device I/O controle codes, and also providing upgraded methods to search for storages and retrieve device format capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevice3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice3 extends IWMDMDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice3
     * @type {Guid}
     */
    static IID => Guid("{6c03e4fe-05db-4dda-9e3c-06233a6d5d65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "SetProperty", "GetFormatCapability", "DeviceIoControl", "FindStorage"]

    /**
     * 
     * @param {PWSTR} pwszPropName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty
     */
    GetProperty(pwszPropName, pValue) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        result := ComCall(18, this, "ptr", pwszPropName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszPropName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-setproperty
     */
    SetProperty(pwszPropName, pValue) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        result := ComCall(19, this, "ptr", pwszPropName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Pointer<WMDM_FORMAT_CAPABILITY>} pFormatSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability
     */
    GetFormatCapability(format, pFormatSupport) {
        result := ComCall(20, this, "int", format, "ptr", pFormatSupport, "HRESULT")
        return result
    }

    /**
     * Sends a control code directly to a specified device driver, causing the corresponding device to perform the corresponding operation.
     * @param {Integer} dwIoControlCode The control code for the operation. This value identifies the specific operation to be performed and the 
     *        type of device on which to perform it.
     * 
     * For a list of the control codes, see Remarks. The documentation for each control code provides usage details 
     *        for the <i>lpInBuffer</i>, <i>nInBufferSize</i>, 
     *        <i>lpOutBuffer</i>, and <i>nOutBufferSize</i> parameters.
     * @param {Pointer<Integer>} lpInBuffer A pointer to the input buffer that contains the data required to perform the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not require input data.
     * @param {Integer} nInBufferSize The size of the input buffer, in bytes.
     * @param {Pointer<Integer>} lpOutBuffer A pointer to the output buffer that is to receive the data returned by the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not return data.
     * @param {Pointer<Integer>} pnOutBufferSize 
     * @returns {HRESULT} If the operation completes successfully, the return value is nonzero.
     * 
     * If the operation fails or is pending, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-deviceiocontrol
     */
    DeviceIoControl(dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, pnOutBufferSize) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "char*" : "ptr"
        lpOutBufferMarshal := lpOutBuffer is VarRef ? "char*" : "ptr"
        pnOutBufferSizeMarshal := pnOutBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, lpOutBufferMarshal, lpOutBuffer, pnOutBufferSizeMarshal, pnOutBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @param {Pointer<IWMDMStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID, ppStorage) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", ppStorage, "HRESULT")
        return result
    }
}
