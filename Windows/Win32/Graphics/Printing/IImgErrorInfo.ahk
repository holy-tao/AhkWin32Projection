#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IErrorInfo.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IImgErrorInfo extends IErrorInfo{
    /**
     * The interface identifier for IImgErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{2bce4ece-d30e-445a-9423-6829be945ad8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDevDescription 
     * @returns {HRESULT} 
     */
    GetDeveloperDescription(pbstrDevDescription) {
        result := ComCall(8, this, "ptr", pbstrDevDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pErrorId 
     * @returns {HRESULT} 
     */
    GetUserErrorId(pErrorId) {
        result := ComCall(9, this, "ptr", pErrorId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcUserParams 
     * @returns {HRESULT} 
     */
    GetUserParameterCount(pcUserParams) {
        result := ComCall(10, this, "uint*", pcUserParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cParam 
     * @param {Pointer<BSTR>} pbstrParam 
     * @returns {HRESULT} 
     */
    GetUserParameter(cParam, pbstrParam) {
        result := ComCall(11, this, "uint", cParam, "ptr", pbstrParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFallback 
     * @returns {HRESULT} 
     */
    GetUserFallback(pbstrFallback) {
        result := ComCall(12, this, "ptr", pbstrFallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pExceptionId 
     * @returns {HRESULT} 
     */
    GetExceptionId(pExceptionId) {
        result := ComCall(13, this, "uint*", pExceptionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ImgErrorInfo>} pErrorInfo 
     * @returns {HRESULT} 
     */
    DetachErrorInfo(pErrorInfo) {
        result := ComCall(14, this, "ptr", pErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
