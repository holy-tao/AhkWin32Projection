#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Communicates detailed error information between a client and an object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ierrorlog
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IErrorLog extends IUnknown{
    /**
     * The interface identifier for IErrorLog
     * @type {Guid}
     */
    static IID => Guid("{3127ca40-446e-11ce-8135-00aa004bb851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @returns {HRESULT} 
     */
    AddError(pszPropName, pExcepInfo) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "ptr", pExcepInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
