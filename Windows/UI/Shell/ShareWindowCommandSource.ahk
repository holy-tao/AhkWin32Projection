#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareWindowCommandSource.ahk
#Include .\IShareWindowCommandSourceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ShareWindowCommandSource.ahk
#Include .\ShareWindowCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an object that your communications app can use to set up communication with the Window Shell to present UI for starting and stopping window sharing. 
  * 
  * Obtain an instance of **ShareWindowCommandSource**, and register to handle the instance's [ShareWindowCommandSource.CommandRequested](sharewindowcommandsource_commandrequested.md) and [ShareWindowCommandSource.CommandInvoked](sharewindowcommandsource_commandinvoked.md) events. Those events are raised by the Windows Shell.
  * 
  * > [!IMPORTANT]
  * > The **Windows.UI.Shell.ShareWindowCommandSource** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * This functionality augments the window sharing feature that your application already implements, providing an alternative method for selecting windows. The design allows your app to present start sharing and stop sharing commands; and to implement those in a way that corresponds to your app's ability to share one or more windows.
 * 
 * Your communications app identifies the window that corresponds with the ability to share windows&mdash;the single app window, or windows that host communication sessions (calls). The Windows Shell uses this to:
 * 
 * * Get application identification information, such as its icon and name, which will be presented with the share commands.
 * * Select among multiple share command sources. The most recently used sharing app will be selected.
 * 
 * Events are used to request commands and invoke them, this includes the [WindowId](/uwp/api/windows.ui.windowid) of the window to be shared.
 * 
 * [IShareWindowCommandSourceInterop](/windows/win32/api/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandsourceinterop) is a native interoperation interface that allows getting a **ShareWindowCommandSource** object.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandsource
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class ShareWindowCommandSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareWindowCommandSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareWindowCommandSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * A static method that you can use to obtain an instance of a [ShareWindowCommandSource](sharewindowcommandsource.md).
     * 
     * > [!IMPORTANT]
     * > The **ShareWindowCommandSource.GetForCurrentView** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @returns {ShareWindowCommandSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandsource.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ShareWindowCommandSource.HasProp("__IShareWindowCommandSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.ShareWindowCommandSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShareWindowCommandSourceStatics.IID)
            ShareWindowCommandSource.__IShareWindowCommandSourceStatics := IShareWindowCommandSourceStatics(factoryPtr)
        }

        return ShareWindowCommandSource.__IShareWindowCommandSourceStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCommandRequestedToken")) {
            this.remove_CommandRequested(this.__OnCommandRequestedToken)
            this.__OnCommandRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCommandInvokedToken")) {
            this.remove_CommandInvoked(this.__OnCommandInvokedToken)
            this.__OnCommandInvoked.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Indicates that the calling app is currently a source of window sharing commands. Call this method during a call or meeting to enable your communications app as a source of window sharing commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandsource.start
     */
    Start() {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.Start()
    }

    /**
     * Indicates that the calling app is not a source of window sharing commands. Call this method when a call or meeting ends to disable your communications app as a source of window sharing commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandsource.stop
     */
    Stop() {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.Stop()
    }

    /**
     * Indicates to the Windows Shell that the sharing state of your communications app has changed.
     * 
     * Call this method whenever your communications app's sharing state changes. If you successfully share a new window in a call or meeting, or you remove an already shared window (whether that's via your own UI, or triggered by a Windows Taskbar action), you must notify your [ShareWindowCommandSource](sharewindowcommandsource.md) instance of that change by calling **ReportCommandChanged**.
     * 
     * The Shell will then flush any information it has received as part of any [ShareWindowCommandSource.CommandRequested](sharewindowcommandsource_commandrequested.md) event, and will update its visible share commands to match the current state of your app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandsource.reportcommandchanged
     */
    ReportCommandChanged() {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.ReportCommandChanged()
    }

    /**
     * 
     * @param {TypedEventHandler<ShareWindowCommandSource, ShareWindowCommandEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommandRequested(handler) {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.add_CommandRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommandRequested(token) {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.remove_CommandRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ShareWindowCommandSource, ShareWindowCommandEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommandInvoked(handler) {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.add_CommandInvoked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommandInvoked(token) {
        if (!this.HasProp("__IShareWindowCommandSource")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandSource := IShareWindowCommandSource(outPtr)
        }

        return this.__IShareWindowCommandSource.remove_CommandInvoked(token)
    }

;@endregion Instance Methods
}
