#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallItem2
     * @type {Guid}
     */
    static IID => Guid("{d3972af8-40c0-4fd7-aa6c-0aa13ca6188c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CancelWithTelemetry", "PauseWithTelemetry", "RestartWithTelemetry"]

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    CancelWithTelemetry(correlationVector) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(6, this, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    PauseWithTelemetry(correlationVector) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(7, this, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a dialog box that prompts the user to restart Windows. When the user clicks the button, the function calls ExitWindowsEx to attempt to restart Windows.
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * Returns the identifier of the button that was pressed to close the dialog box.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-restartdialog
     */
    RestartWithTelemetry(correlationVector) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(8, this, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
