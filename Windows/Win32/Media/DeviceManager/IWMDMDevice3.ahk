#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\WMDM_FORMAT_CAPABILITY.ahk
#Include .\IWMDMStorage.ahk
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
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-getproperty
     */
    GetProperty(pwszPropName) {
        pwszPropName := pwszPropName is String ? StrPtr(pwszPropName) : pwszPropName

        pValue := PROPVARIANT()
        result := ComCall(18, this, "ptr", pwszPropName, "ptr", pValue, "HRESULT")
        return pValue
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
     * @returns {WMDM_FORMAT_CAPABILITY} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-getformatcapability
     */
    GetFormatCapability(format) {
        pFormatSupport := WMDM_FORMAT_CAPABILITY()
        result := ComCall(20, this, "int", format, "ptr", pFormatSupport, "HRESULT")
        return pFormatSupport
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
     * @param {Pointer<Integer>} pnOutBufferSize 
     * @returns {Integer} A pointer to the output buffer that is to receive the data returned by the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not return data.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-deviceiocontrol
     */
    DeviceIoControl(dwIoControlCode, lpInBuffer, nInBufferSize, pnOutBufferSize) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "char*" : "ptr"
        pnOutBufferSizeMarshal := pnOutBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, "char*", &lpOutBuffer := 0, pnOutBufferSizeMarshal, pnOutBufferSize, "HRESULT")
        return lpOutBuffer
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @returns {IWMDMStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IWMDMStorage(ppStorage)
    }
}
