#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostErrorSink extends IUnknown{
    /**
     * The interface identifier for IDebugHostErrorSink
     * @type {Guid}
     */
    static IID => Guid("{c8ff0f0b-fce9-467e-8bb3-5d69ef109c00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} errClass 
     * @param {HRESULT} hrError 
     * @param {PWSTR} message 
     * @returns {HRESULT} 
     */
    ReportError(errClass, hrError, message) {
        message := message is String ? StrPtr(message) : message

        result := ComCall(3, this, "int", errClass, "int", hrError, "ptr", message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
