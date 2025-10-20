#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Accessibility\IAccessible.ahk

/**
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IAccessibleWinSAT extends IAccessible{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccessibleWinSAT
     * @type {Guid}
     */
    static IID => Guid("{30e6018a-94a8-4ff8-a69a-71b67413f07b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAccessiblityData"]

    /**
     * 
     * @param {PWSTR} wsName 
     * @param {PWSTR} wsValue 
     * @param {PWSTR} wsDesc 
     * @returns {HRESULT} 
     */
    SetAccessiblityData(wsName, wsValue, wsDesc) {
        wsName := wsName is String ? StrPtr(wsName) : wsName
        wsValue := wsValue is String ? StrPtr(wsValue) : wsValue
        wsDesc := wsDesc is String ? StrPtr(wsDesc) : wsDesc

        result := ComCall(28, this, "ptr", wsName, "ptr", wsValue, "ptr", wsDesc, "HRESULT")
        return result
    }
}
