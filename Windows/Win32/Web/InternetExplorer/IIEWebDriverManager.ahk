#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IIEWebDriverManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIEWebDriverManager
     * @type {Guid}
     */
    static IID => Guid("{bd1dc630-6590-4ca2-a293-6bc72b2438d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ExecuteCommand"]

    /**
     * 
     * @param {PWSTR} command 
     * @param {Pointer<PWSTR>} response 
     * @returns {HRESULT} 
     */
    ExecuteCommand(command, response) {
        command := command is String ? StrPtr(command) : command

        result := ComCall(7, this, "ptr", command, "ptr", response, "HRESULT")
        return result
    }
}
