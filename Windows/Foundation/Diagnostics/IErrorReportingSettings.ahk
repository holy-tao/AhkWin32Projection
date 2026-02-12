#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents diagnostic error reporting settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ierrorreportingsettings
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IErrorReportingSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorReportingSettings
     * @type {Guid}
     */
    static IID => Guid("{16369792-b03e-4ba1-8bb8-d28f4ab4d2c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetErrorOptions", "GetErrorOptions"]

    /**
     * Sets the type of error reporting for the error object.
     * @param {Integer} value One of the enumeration values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ierrorreportingsettings.seterroroptions
     */
    SetErrorOptions(value) {
        result := ComCall(6, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the type of error reporting for the error object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.ierrorreportingsettings.geterroroptions
     */
    GetErrorOptions() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
