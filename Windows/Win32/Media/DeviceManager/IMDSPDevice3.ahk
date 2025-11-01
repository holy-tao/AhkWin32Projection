#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-getproperty
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
     * @param {Pointer<WMDM_FORMAT_CAPABILITY>} pFormatSupport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-getformatcapability
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
        result := ComCall(21, this, "uint", dwIoControlCode, "char*", lpInBuffer, "uint", nInBufferSize, "char*", lpOutBuffer, "uint*", pnOutBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} findScope 
     * @param {PWSTR} pwszUniqueID 
     * @param {Pointer<IMDSPStorage>} ppStorage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevice3-findstorage
     */
    FindStorage(findScope, pwszUniqueID, ppStorage) {
        pwszUniqueID := pwszUniqueID is String ? StrPtr(pwszUniqueID) : pwszUniqueID

        result := ComCall(22, this, "int", findScope, "ptr", pwszUniqueID, "ptr*", ppStorage, "HRESULT")
        return result
    }
}
