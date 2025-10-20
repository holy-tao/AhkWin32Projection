#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides detailed contextual error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ierrorinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IErrorInfo extends IUnknown{
    /**
     * The interface identifier for IErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{1cf2b120-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pGUID 
     * @returns {HRESULT} 
     */
    GetGUID(pGUID) {
        result := ComCall(3, this, "ptr", pGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrSource 
     * @returns {HRESULT} 
     */
    GetSource(pBstrSource) {
        result := ComCall(4, this, "ptr", pBstrSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrDescription 
     * @returns {HRESULT} 
     */
    GetDescription(pBstrDescription) {
        result := ComCall(5, this, "ptr", pBstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     */
    GetHelpFile(pBstrHelpFile) {
        result := ComCall(6, this, "ptr", pBstrHelpFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHelpContext 
     * @returns {HRESULT} 
     */
    GetHelpContext(pdwHelpContext) {
        result := ComCall(7, this, "uint*", pdwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
