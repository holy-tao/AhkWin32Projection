#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows language projections to make available to the system any and all context from an exception that gets thrown from the context of a catch handler that catches a different exception.
 * @see https://docs.microsoft.com/windows/win32/api//restrictederrorinfo/nn-restrictederrorinfo-ilanguageexceptiontransform
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ILanguageExceptionTransform extends IUnknown{
    /**
     * The interface identifier for ILanguageExceptionTransform
     * @type {Guid}
     */
    static IID => Guid("{feb5a271-a6cd-45ce-880a-696706badc65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRestrictedErrorInfo>} restrictedErrorInfo 
     * @returns {HRESULT} 
     */
    GetTransformedRestrictedErrorInfo(restrictedErrorInfo) {
        result := ComCall(3, this, "ptr", restrictedErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
