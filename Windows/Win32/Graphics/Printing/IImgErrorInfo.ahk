#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ImgErrorInfo.ahk
#Include ..\..\System\Com\IErrorInfo.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IImgErrorInfo extends IErrorInfo{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeveloperDescription", "GetUserErrorId", "GetUserParameterCount", "GetUserParameter", "GetUserFallback", "GetExceptionId", "DetachErrorInfo"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetDeveloperDescription() {
        pbstrDevDescription := BSTR()
        result := ComCall(8, this, "ptr", pbstrDevDescription, "HRESULT")
        return pbstrDevDescription
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetUserErrorId() {
        pErrorId := Guid()
        result := ComCall(9, this, "ptr", pErrorId, "HRESULT")
        return pErrorId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetUserParameterCount() {
        result := ComCall(10, this, "uint*", &pcUserParams := 0, "HRESULT")
        return pcUserParams
    }

    /**
     * 
     * @param {Integer} cParam 
     * @returns {BSTR} 
     */
    GetUserParameter(cParam) {
        pbstrParam := BSTR()
        result := ComCall(11, this, "uint", cParam, "ptr", pbstrParam, "HRESULT")
        return pbstrParam
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUserFallback() {
        pbstrFallback := BSTR()
        result := ComCall(12, this, "ptr", pbstrFallback, "HRESULT")
        return pbstrFallback
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExceptionId() {
        result := ComCall(13, this, "uint*", &pExceptionId := 0, "HRESULT")
        return pExceptionId
    }

    /**
     * 
     * @returns {ImgErrorInfo} 
     */
    DetachErrorInfo() {
        pErrorInfo := ImgErrorInfo()
        result := ComCall(14, this, "ptr", pErrorInfo, "HRESULT")
        return pErrorInfo
    }
}
