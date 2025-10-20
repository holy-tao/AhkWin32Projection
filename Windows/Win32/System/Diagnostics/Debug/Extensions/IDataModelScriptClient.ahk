#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelScriptClient extends IUnknown{
    /**
     * The interface identifier for IDataModelScriptClient
     * @type {Guid}
     */
    static IID => Guid("{3b362b0e-89f0-46c6-a663-dfdc95194aef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} errClass 
     * @param {HRESULT} hrFail 
     * @param {PWSTR} message 
     * @param {Integer} line 
     * @param {Integer} position 
     * @returns {HRESULT} 
     */
    ReportError(errClass, hrFail, message, line, position) {
        message := message is String ? StrPtr(message) : message

        result := ComCall(3, this, "int", errClass, "int", hrFail, "ptr", message, "uint", line, "uint", position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
