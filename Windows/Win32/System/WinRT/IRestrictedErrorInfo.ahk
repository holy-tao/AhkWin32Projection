#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents the details of an error, including restricted error information.
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-irestrictederrorinfo
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IRestrictedErrorInfo extends IUnknown{
    /**
     * The interface identifier for IRestrictedErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{82ba7092-4c88-427d-a7bc-16dd93feb67e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @param {Pointer<HRESULT>} error 
     * @param {Pointer<BSTR>} restrictedDescription 
     * @param {Pointer<BSTR>} capabilitySid 
     * @returns {HRESULT} 
     */
    GetErrorDetails(description, error, restrictedDescription, capabilitySid) {
        result := ComCall(3, this, "ptr", description, "ptr", error, "ptr", restrictedDescription, "ptr", capabilitySid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} reference 
     * @returns {HRESULT} 
     */
    GetReference(reference) {
        result := ComCall(4, this, "ptr", reference, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
