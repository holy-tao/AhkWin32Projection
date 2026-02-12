#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IsolatedWindowsEnvironmentUserInfo.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\IsolatedWindowsEnvironmentShareFileResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironment3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironment3
     * @type {Guid}
     */
    static IID => Guid("{cb7fc7d2-d06e-4c26-8ada-dacdaaad03f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserInfo", "ShareFileAsync", "ShareFileWithTelemetryAsync"]

    /**
     * 
     * @returns {IsolatedWindowsEnvironmentUserInfo} 
     */
    GetUserInfo() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IsolatedWindowsEnvironmentUserInfo(result_)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {IsolatedWindowsEnvironmentShareFileRequestOptions} options 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFileResult>} 
     */
    ShareFileAsync(filePath, options) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(7, this, "ptr", filePath, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentShareFileResult, operation)
    }

    /**
     * 
     * @param {HSTRING} filePath 
     * @param {IsolatedWindowsEnvironmentShareFileRequestOptions} options 
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFileResult>} 
     */
    ShareFileWithTelemetryAsync(filePath, options, telemetryParameters) {
        if(filePath is String) {
            pin := HSTRING.Create(filePath)
            filePath := pin.Value
        }
        filePath := filePath is Win32Handle ? NumGet(filePath, "ptr") : filePath

        result := ComCall(8, this, "ptr", filePath, "ptr", options, "ptr", telemetryParameters, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IsolatedWindowsEnvironmentShareFileResult, operation)
    }
}
