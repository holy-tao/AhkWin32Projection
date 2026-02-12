#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HttpDiagnosticProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Diagnostics
 * @version WindowsRuntime 1.4
 */
class IHttpDiagnosticProviderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpDiagnosticProviderStatics
     * @type {Guid}
     */
    static IID => Guid("{5b824ec1-6a6c-47cc-afec-1e86bc26053b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromProcessDiagnosticInfo"]

    /**
     * 
     * @param {ProcessDiagnosticInfo} processDiagnosticInfo_ 
     * @returns {HttpDiagnosticProvider} 
     */
    CreateFromProcessDiagnosticInfo(processDiagnosticInfo_) {
        result := ComCall(6, this, "ptr", processDiagnosticInfo_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpDiagnosticProvider(value)
    }
}
