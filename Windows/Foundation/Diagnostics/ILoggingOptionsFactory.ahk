#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LoggingOptions.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingOptionsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingOptionsFactory
     * @type {Guid}
     */
    static IID => Guid("{d713c6cb-98ab-464b-9f22-a3268478368a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithKeywords"]

    /**
     * 
     * @param {Integer} keywords 
     * @returns {LoggingOptions} 
     */
    CreateWithKeywords(keywords) {
        result := ComCall(6, this, "int64", keywords, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LoggingOptions(result_)
    }
}
