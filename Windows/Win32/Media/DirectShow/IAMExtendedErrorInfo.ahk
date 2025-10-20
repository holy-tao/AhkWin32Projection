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
     * 
     * @param {Pointer<VARIANT_BOOL>} pHasError 
     * @returns {HRESULT} 
     */
    get_HasError(pHasError) {
        result := ComCall(7, this, "ptr", pHasError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrErrorDescription 
     * @returns {HRESULT} 
     */
    get_ErrorDescription(pbstrErrorDescription) {
        result := ComCall(8, this, "ptr", pbstrErrorDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pErrorCode 
     * @returns {HRESULT} 
     */
    get_ErrorCode(pErrorCode) {
        result := ComCall(9, this, "int*", pErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
