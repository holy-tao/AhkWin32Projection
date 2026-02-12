#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\ProtocolForResultsOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Describes the activation arguments when an app is launched via [LaunchUriForResultsAsync](../windows.system/launcher_launchuriforresultsasync_148601521.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolforresultsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IProtocolForResultsActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtocolForResultsActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e75132c2-7ae7-4517-80ac-dbe8d7cc5b9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtocolForResultsOperation"]

    /**
     * Gets the **ProtocolForResultsOperation** that you can then use to signal that your app is ready to return to the app that launched it for results.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iprotocolforresultsactivatedeventargs.protocolforresultsoperation
     * @type {ProtocolForResultsOperation} 
     */
    ProtocolForResultsOperation {
        get => this.get_ProtocolForResultsOperation()
    }

    /**
     * 
     * @returns {ProtocolForResultsOperation} 
     */
    get_ProtocolForResultsOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProtocolForResultsOperation(value)
    }
}
