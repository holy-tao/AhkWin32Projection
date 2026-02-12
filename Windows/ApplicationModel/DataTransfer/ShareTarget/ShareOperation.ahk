#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareOperation.ahk
#Include .\IShareOperation2.ahk
#Include .\IShareOperation3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Handles the bulk of the work during a share operation. This includes the data that the user wants to share, setting or removing QuickLinks, and informing the system about the status of the operation.
 * @remarks
 * When a user selects your app as the target of a share action, an [activated](../windows.applicationmodel.core/coreapplicationview_activated.md) event fires. The object that this event sends to your app contains the instance of the **ShareOperation** class.
 * 
 * An app currently open as a Share target cannot initiate an additional ShareOperation, or launch a [FileOpenPicker](../windows.storage.pickers/fileopenpicker.md) or [FileSavePicker](../windows.storage.pickers/filesavepicker.md).
 * 
 * All ShareOperation APIs should only be called after the CoreWindow for the Share target has been [activated](../windows.ui.core/corewindow_activated.md). The Share platform creates an entry for share operation only after the window has been activated.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation
 * @namespace Windows.ApplicationModel.DataTransfer.ShareTarget
 * @version WindowsRuntime 1.4
 */
class ShareOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains a DataPackage object with the data that the user wants to share.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.data
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * A string that contains the ID of a QuickLink.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.quicklinkid
     * @type {HSTRING} 
     */
    QuickLinkId {
        get => this.get_QuickLinkId()
    }

    /**
     * Gets the contacts for the share operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.contacts
     * @type {IVectorView<Contact>} 
     */
    Contacts {
        get => this.get_Contacts()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.get_Data()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QuickLinkId() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.get_QuickLinkId()
    }

    /**
     * Removes the QuickLink from the list of QuickLinks that are available to the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.removethisquicklink
     */
    RemoveThisQuickLink() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.RemoveThisQuickLink()
    }

    /**
     * Specifies that the app has started to acquire the content that the user wants to share.
     * @remarks
     * > [!NOTE]
     * > This method does nothing when called on Windows Phone 8.1.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reportstarted
     */
    ReportStarted() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportStarted()
    }

    /**
     * Specifies that the app has acquired the content that the user wants to share.
     * @remarks
     * > This method does nothing when called on Windows Phone 8.1.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reportdataretrieved
     */
    ReportDataRetrieved() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportDataRetrieved()
    }

    /**
     * Specifies that the app has requested that the system allow the sharing operation to run as a background task.
     * @remarks
     * > [!NOTE]
     * > This method does nothing when called on Windows Phone 8.1.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reportsubmittedbackgroundtask
     */
    ReportSubmittedBackgroundTask() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportSubmittedBackgroundTask()
    }

    /**
     * Specifies that the sharing operation is complete. A QuickLink that the system can save as a shortcut for future sharing operations is included.
     * @param {QuickLink} quicklink_ A QuickLink object that the system saves as a shortcut for future sharing operations.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reportcompleted
     */
    ReportCompletedWithQuickLink(quicklink_) {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportCompletedWithQuickLink(quicklink_)
    }

    /**
     * Specifies that the sharing operation is complete.
     * @remarks
     * When your app acts as a target for a share operation, it should call **reportComplete** after it has processed the data being shared. This method closes the app window and returns the user to the source app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportCompleted1()
    }

    /**
     * Specifies that an error occurred during the sharing operation.
     * @remarks
     * This API was marked as deprecated in SDK versions 1511 and 1607. However, this API is no longer deprecated as of 1703. You can suppress the deprecation warning in Visual Studio by following instructions in the [How to: Suppress Compiler Warnings](/visualstudio/ide/how-to-suppress-compiler-warnings) topic.
     * @param {HSTRING} value Specifies the error message. The system displays this message to the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.reporterror
     */
    ReportError(value) {
        if (!this.HasProp("__IShareOperation")) {
            if ((queryResult := this.QueryInterface(IShareOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation := IShareOperation(outPtr)
        }

        return this.__IShareOperation.ReportError(value)
    }

    /**
     * Closes the share pane.
     * @remarks
     * Call the DismissUI method to dismiss the share pane programmatically. Calling DismissUI is similar to the user dismissing the share pane by tapping away from it. If the share operation takes a long time, the app continues to run in the background. If the operation isn't long-running, it has 10 seconds to run before being terminated.
     * 
     * This API was marked as deprecated in SDK versions 1511 and 1607. However, this API is no longer deprecated as of 1703. You can suppress the deprecation warning in Visual Studio by following instructions in the [How to: Suppress Compiler Warnings](/visualstudio/ide/how-to-suppress-compiler-warnings) topic.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.sharetarget.shareoperation.dismissui
     */
    DismissUI() {
        if (!this.HasProp("__IShareOperation2")) {
            if ((queryResult := this.QueryInterface(IShareOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation2 := IShareOperation2(outPtr)
        }

        return this.__IShareOperation2.DismissUI()
    }

    /**
     * 
     * @returns {IVectorView<Contact>} 
     */
    get_Contacts() {
        if (!this.HasProp("__IShareOperation3")) {
            if ((queryResult := this.QueryInterface(IShareOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareOperation3 := IShareOperation3(outPtr)
        }

        return this.__IShareOperation3.get_Contacts()
    }

;@endregion Instance Methods
}
