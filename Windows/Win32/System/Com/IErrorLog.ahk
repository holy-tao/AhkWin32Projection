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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddError"]

    /**
     * 
     * @param {PWSTR} pszPropName 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorlog-adderror
     */
    AddError(pszPropName, pExcepInfo) {
        pszPropName := pszPropName is String ? StrPtr(pszPropName) : pszPropName

        result := ComCall(3, this, "ptr", pszPropName, "ptr", pExcepInfo, "HRESULT")
        return result
    }
}
