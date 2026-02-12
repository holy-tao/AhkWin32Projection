#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtocolForResultsOperation.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the result to the application that launched the current application for results.
 * @remarks
 * Use this class from an activated application launched via [Launcher.LaunchUriForResultsAsync](launcher_launchuriforresultsasync_148601521.md) to indicate when activation is complete and to return a result to the activating application. This class is passed to the activated application's [Application.OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) method via the [IActivatedEventArgs](../windows.applicationmodel.activation/iactivatedeventargs.md) argument.
 * @see https://learn.microsoft.com/uwp/api/windows.system.protocolforresultsoperation
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProtocolForResultsOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtocolForResultsOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtocolForResultsOperation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the application activated for results is ready to return to the application that launched it for results.
     * @param {ValueSet} data The data to return to the application that activated this app. 
     * 
     * > [!NOTE]
     * > The amount of data that can be transferred must not exceed 100 KB.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.protocolforresultsoperation.reportcompleted
     */
    ReportCompleted(data) {
        if (!this.HasProp("__IProtocolForResultsOperation")) {
            if ((queryResult := this.QueryInterface(IProtocolForResultsOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtocolForResultsOperation := IProtocolForResultsOperation(outPtr)
        }

        return this.__IProtocolForResultsOperation.ReportCompleted(data)
    }

;@endregion Instance Methods
}
