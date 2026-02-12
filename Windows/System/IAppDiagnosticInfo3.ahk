#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\AppActivationResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppDiagnosticInfo3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDiagnosticInfo3
     * @type {Guid}
     */
    static IID => Guid("{c895c63d-dd61-4c65-babd-81a10b4f9815}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchAsync"]

    /**
     * 
     * @returns {IAsyncOperation<AppActivationResult>} 
     */
    LaunchAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppActivationResult, operation)
    }
}
