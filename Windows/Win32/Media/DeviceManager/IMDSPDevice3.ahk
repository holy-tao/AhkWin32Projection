#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\WMDM_FORMAT_CAPABILITY.ahk
#Include .\IMDSPStorage.ahk
#Include .\IMDSPDevice2.ahk

/**
 * The IMDSPDevice3 interface must be supported for devices that expect to synchronize with Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice3
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice3 extends IMDSPDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDevice3
     * @type {Guid}
     */
    static IID => Guid("{1a839845-fc55-487c-976f-ee38ac0e8c4e}")

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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-getproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-setproperty
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-getformatcapability
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
     * @returns {IMDSPStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", &ppStorage := 0, "HRESULT")
        return IMDSPStorage(ppStorage)
    }
}
