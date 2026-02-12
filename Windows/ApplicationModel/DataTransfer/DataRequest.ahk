#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Lets your app supply the content the user wants to share or specify a message, if an error occurs.
 * @remarks
 * Your app receives a **DataRequest** object when a [datarequested](datatransfermanager_datarequested.md) event occurs. With this object, your app can supply data to a target app by using a [DataPackage](datapackage.md) object, use a deferral object to call a function, or inform the target app that an error occurred.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequest
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Sets or gets a [DataPackage](datapackage.md) object that contains the content a user wants to share.
     * @remarks
     * The Data property enables your app to supply data to a target app. Your app must supply this data by using a [DataPackage](datapackage.md) object.
     * 
     * Use this property when your app has the content immediately available that the user wants to share. If you need to call a function to generate the [DataPackage](datapackage.md), use the [GetDeferral](datarequest_getdeferral_254836512.md) method.
     * 
     * When your app cannot supply a [DataPackage](datapackage.md) object, use the [FailWithDisplayText](datarequest_failwithdisplaytext_760676443.md) method to cancel the share and provide a message that the target app can display to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequest.data
     * @type {DataPackage} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets the deadline for finishing a delayed rendering operation. If execution goes beyond that deadline, the results of delayed rendering are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_Data() {
        if (!this.HasProp("__IDataRequest")) {
            if ((queryResult := this.QueryInterface(IDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequest := IDataRequest(outPtr)
        }

        return this.__IDataRequest.get_Data()
    }

    /**
     * 
     * @param {DataPackage} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IDataRequest")) {
            if ((queryResult := this.QueryInterface(IDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequest := IDataRequest(outPtr)
        }

        return this.__IDataRequest.put_Data(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IDataRequest")) {
            if ((queryResult := this.QueryInterface(IDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequest := IDataRequest(outPtr)
        }

        return this.__IDataRequest.get_Deadline()
    }

    /**
     * Cancels the sharing operation and supplies an error string to display to the user.
     * @remarks
     * Use the **FailWithDisplayText** method when your app is unable to supply a [DataPackage](datapackage.md) to a target app. This method cancels the share operation and supplies a text message to the target app. The target app can then display this text to the user to explain why the share operation failed.
     * 
     * This API was marked as deprecated in SDK versions 1511 and 1607. However, this API is no longer deprecated as of 1703. You can suppress the deprecation warning in Visual Studio by following instructions in the [How to: Suppress Compiler Warnings](/visualstudio/ide/how-to-suppress-compiler-warnings) topic.
     * @param {HSTRING} value The text to display to the user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequest.failwithdisplaytext
     */
    FailWithDisplayText(value) {
        if (!this.HasProp("__IDataRequest")) {
            if ((queryResult := this.QueryInterface(IDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequest := IDataRequest(outPtr)
        }

        return this.__IDataRequest.FailWithDisplayText(value)
    }

    /**
     * Supports asynchronous sharing operations by creating and returning a [DataRequestDeferral](datarequestdeferral.md) object.
     * @remarks
     * The **GetDeferral** method allows your app to call a function during a share operation, so that your app can asynchronously generate the [DataPackage](datapackage.md) object for the target app.
     * 
     * Use this method when you want to use an asynchronous function call to generate the [DataPackage](datapackage.md) during a share operation. This function must return a [DataPackage](datapackage.md) object within 200ms to prevent the operation from timing out. If your app shares content that takes more time to package, such as a collection of files or photos, don't use this method. Instead, use the [SetDataProvider](datapackage_setdataprovider_375548563.md) method to assign a delegate to a [DataPackage](datapackage.md) and return that [DataPackage](datapackage.md) to the target app.
     * @returns {DataRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.datarequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDataRequest")) {
            if ((queryResult := this.QueryInterface(IDataRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataRequest := IDataRequest(outPtr)
        }

        return this.__IDataRequest.GetDeferral()
    }

;@endregion Instance Methods
}
