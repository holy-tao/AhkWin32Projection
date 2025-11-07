#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMExtendedErrorInfo interface is used to obtain error information. Note  This interface is not implemented by any default components in DirectShow. .
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamextendederrorinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMExtendedErrorInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMExtendedErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f6-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HasError", "get_ErrorDescription", "get_ErrorCode"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pHasError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_haserror
     */
    get_HasError(pHasError) {
        pHasErrorMarshal := pHasError is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, pHasErrorMarshal, pHasError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrErrorDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_errordescription
     */
    get_ErrorDescription(pbstrErrorDescription) {
        result := ComCall(8, this, "ptr", pbstrErrorDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pErrorCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamextendederrorinfo-get_errorcode
     */
    get_ErrorCode(pErrorCode) {
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pErrorCodeMarshal, pErrorCode, "HRESULT")
        return result
    }
}
