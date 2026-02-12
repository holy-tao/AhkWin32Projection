#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppDiagnosticInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppDiagnosticInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDiagnosticInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{ce6925bf-10ca-40c8-a9ca-c5c96501866e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestInfoAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVector<AppDiagnosticInfo>>} 
     */
    RequestInfoAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, AppDiagnosticInfo), operation)
    }
}
