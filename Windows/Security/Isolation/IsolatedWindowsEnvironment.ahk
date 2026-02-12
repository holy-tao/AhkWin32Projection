#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironment.ahk
#Include .\IIsolatedWindowsEnvironment2.ahk
#Include .\IIsolatedWindowsEnvironment3.ahk
#Include .\IIsolatedWindowsEnvironment4.ahk
#Include .\IIsolatedWindowsEnvironmentFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Create and manage Hypervisor-based Isolated Environments for applications to open and process untrusted data in a virtualized environment to protect the host operating system from potentially malicious content in the file.
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * 
 * Runtime class
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironment.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * **Deprecated.** Create an Isolated Windows Environment Asynchronously and correlate with telemetry events.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {IsolatedWindowsEnvironmentOptions} options Isolated Windows Environment configuration options defined by [isolatedwindowsenvironmentoptions](isolatedwindowsenvironmentoptions.md)
     * @returns {IAsyncOperationWithProgress<IsolatedWindowsEnvironmentCreateResult, IsolatedWindowsEnvironmentCreateProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.createasync
     */
    static CreateAsync(options) {
        if (!IsolatedWindowsEnvironment.HasProp("__IIsolatedWindowsEnvironmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentFactory.IID)
            IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory := IIsolatedWindowsEnvironmentFactory(factoryPtr)
        }

        return IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory.CreateAsync(options)
    }

    /**
     * **Deprecated.** Create an Isolated Windows Environment asynchronously.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {IsolatedWindowsEnvironmentOptions} options Isolated Windows Environment configuration options defined by [isolatedwindowsenvironmentoptions](isolatedwindowsenvironmentoptions.md)
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperationWithProgress<IsolatedWindowsEnvironmentCreateResult, IsolatedWindowsEnvironmentCreateProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.createasync
     */
    static CreateWithTelemetryAsync(options, telemetryParameters) {
        if (!IsolatedWindowsEnvironment.HasProp("__IIsolatedWindowsEnvironmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentFactory.IID)
            IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory := IIsolatedWindowsEnvironmentFactory(factoryPtr)
        }

        return IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory.CreateWithTelemetryAsync(options, telemetryParameters)
    }

    /**
     * **Deprecated.** Returns reference to the Isolated Windows Environment based on the [Id](isolatedwindowsenvironment_id.md).
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} environmentId ID assigned to an Isolated Windows Environment.
     * @returns {IsolatedWindowsEnvironment} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.getbyid
     */
    static GetById(environmentId) {
        if (!IsolatedWindowsEnvironment.HasProp("__IIsolatedWindowsEnvironmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentFactory.IID)
            IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory := IIsolatedWindowsEnvironmentFactory(factoryPtr)
        }

        return IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory.GetById(environmentId)
    }

    /**
     * **Deprecated.** Returns a list of Isolated Windows Environments registered to specific owner.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} environmentOwnerId Unique identifier for owner of Isolated Windows Environment.
     * @returns {IVectorView<IsolatedWindowsEnvironment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.findbyownerid
     */
    static FindByOwnerId(environmentOwnerId) {
        if (!IsolatedWindowsEnvironment.HasProp("__IIsolatedWindowsEnvironmentFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIsolatedWindowsEnvironmentFactory.IID)
            IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory := IIsolatedWindowsEnvironmentFactory(factoryPtr)
        }

        return IsolatedWindowsEnvironment.__IIsolatedWindowsEnvironmentFactory.FindByOwnerId(environmentOwnerId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * **Deprecated.** Returns ID for Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.get_Id()
    }

    /**
     * **Deprecated.** Allow processes to execute inside an Isolated Windows Environment with telemetry correlation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} hostExePath String of host execution path.
     * @param {HSTRING} arguments String
     * @param {Integer} activator [IsolatedWindowsEnvironmentActivator](isolatedwindowsenvironmentactivator.md)
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentStartProcessResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.startprocesssilentlyasync
     */
    StartProcessSilentlyAsync(hostExePath, arguments, activator) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.StartProcessSilentlyAsync(hostExePath, arguments, activator)
    }

    /**
     * **Deprecated.** Allow processes to execute inside an Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} hostExePath String of host execution path.
     * @param {HSTRING} arguments String
     * @param {Integer} activator [IsolatedWindowsEnvironmentActivator](isolatedwindowsenvironmentactivator.md)
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentStartProcessResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.startprocesssilentlyasync
     */
    StartProcessSilentlyWithTelemetryAsync(hostExePath, arguments, activator, telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.StartProcessSilentlyWithTelemetryAsync(hostExePath, arguments, activator, telemetryParameters)
    }

    /**
     * **Deprecated.** Share host folder with Isolated Windows Environment with telemetry correlation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} hostFolder String of of host folder name.
     * @param {IsolatedWindowsEnvironmentShareFolderRequestOptions} requestOptions [isolatedwindowsenvironmentsharefolderrequestoptions](isolatedwindowsenvironmentsharefolderrequestoptions.md)
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFolderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.sharefolderasync
     */
    ShareFolderAsync(hostFolder, requestOptions) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.ShareFolderAsync(hostFolder, requestOptions)
    }

    /**
     * **Deprecated.** Share host folder with Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} hostFolder Name of host folder.
     * @param {IsolatedWindowsEnvironmentShareFolderRequestOptions} requestOptions [isolatedwindowsenvironmentsharefolderrequestoptions](isolatedwindowsenvironmentsharefolderrequestoptions.md)
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFolderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.sharefolderasync
     */
    ShareFolderWithTelemetryAsync(hostFolder, requestOptions, telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.ShareFolderWithTelemetryAsync(hostFolder, requestOptions, telemetryParameters)
    }

    /**
     * **Deprecated.** Allows applications to open files in an Isolated Windows Environment with telemetry correlation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} appExePath String of application execution path.
     * @param {HSTRING} argumentsTemplate String to specify the relative position of filepath with respect to other arguments to be passed:
     * "%1 /foo" will execute the file launch as "appname.exe fileapth /foo" in the container
     * %1 is replace by filepath
     * "/foo %1" => "appname.exe /foo filepath"
     * "/foo %1 /bar" => "appname.exe /foo filepath /bar"
     * @param {HSTRING} filePath String for path of file to be opened in Isolated Windows Environment
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentLaunchFileResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.launchfilewithuiasync
     */
    LaunchFileWithUIAsync(appExePath, argumentsTemplate, filePath) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.LaunchFileWithUIAsync(appExePath, argumentsTemplate, filePath)
    }

    /**
     * **Deprecated.** Allows applications to open files in an Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {HSTRING} appExePath String of application execution path.
     * @param {HSTRING} argumentsTemplate String to specify the relative position of filepath with respect to other arguments to be passed:
     * "%1 /foo" will execute the file launch as "appname.exe fileapth /foo" in the container
     * %1 is replace by filepath
     * "/foo %1" => "appname.exe /foo filepath"
     * "/foo %1 /bar" => "appname.exe /foo filepath /bar"
     * @param {HSTRING} filePath String for path of file to be opened in Isolated Windows Environment.
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentLaunchFileResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.launchfilewithuiasync
     */
    LaunchFileWithUIAndTelemetryAsync(appExePath, argumentsTemplate, filePath, telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.LaunchFileWithUIAndTelemetryAsync(appExePath, argumentsTemplate, filePath, telemetryParameters)
    }

    /**
     * **Deprecated.** Terminate Isolated Windows Environment asynchronously with telemetry correlation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.terminateasync
     */
    TerminateAsync() {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.TerminateAsync()
    }

    /**
     * **Deprecated.** Terminate Isolated Windows Environment asynchronously.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.terminateasync
     */
    TerminateWithTelemetryAsync(telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.TerminateWithTelemetryAsync(telemetryParameters)
    }

    /**
     * **Deprecated.** Register message receiver callback.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @param {MessageReceivedCallback} messageReceivedCallback_ Callback function [messageReceivedCallback](messagereceivedcallback.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.registermessagereceiver
     */
    RegisterMessageReceiver(receiverId, messageReceivedCallback_) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.RegisterMessageReceiver(receiverId, messageReceivedCallback_)
    }

    /**
     * **Deprecated.** Unregisters message receiver callback.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.unregistermessagereceiver
     */
    UnregisterMessageReceiver(receiverId) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment := IIsolatedWindowsEnvironment(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment.UnregisterMessageReceiver(receiverId)
    }

    /**
     * **Deprecated.** Post a message from the host to the receiver that is registered on the Isolated Windows Environment side and correlate with telemetry events.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @param {IIterable<IInspectable>} message IIterable
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentPostMessageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.postmessagetoreceiverasync
     */
    PostMessageToReceiverAsync(receiverId, message) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment2 := IIsolatedWindowsEnvironment2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment2.PostMessageToReceiverAsync(receiverId, message)
    }

    /**
     * **Deprecated.** Post a message from the host to the receiver that is registered on the Isolated Windows Environment side.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Guid} receiverId GUID for message receiver.
     * @param {IIterable<IInspectable>} message IIterable
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentPostMessageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.postmessagetoreceiverasync
     */
    PostMessageToReceiverWithTelemetryAsync(receiverId, message, telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment2")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment2 := IIsolatedWindowsEnvironment2(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment2.PostMessageToReceiverWithTelemetryAsync(receiverId, message, telemetryParameters)
    }

    /**
     * **Deprecated.** Since the isolated environment user is different and separate from the host user, a host application may need to know information about the user signed into the isolated environment, such as the username and SID. This API exposes those values without needing to wait for the sign-in process to complete.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @returns {IsolatedWindowsEnvironmentUserInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.getuserinfo
     */
    GetUserInfo() {
        if (!this.HasProp("__IIsolatedWindowsEnvironment3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment3 := IIsolatedWindowsEnvironment3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment3.GetUserInfo()
    }

    /**
     * **Deprecated.** Share host file with Isolated Windows Environment with telemetry correlation.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * The shared file shall appear in a folder with a randomly generated file path in the Isolated Windows Environment that will be provided in the [IsolatedWindowsEnvironmentShareFileResult](isolatedwindowsenvironmentsharefileresult.md). Any data written to this folder will be copied back to the host. It is recommended to set the AllowWrite flag to false in [isolatedwindowsenvironmentsharefilerequestoptions](isolatedwindowsenvironmentsharefilerequestoptions.md) to prevent this.
     * @param {HSTRING} filePath String of host file path.
     * @param {IsolatedWindowsEnvironmentShareFileRequestOptions} options [IsolatedWindowsEnvironmentShareFileRequestOptions](isolatedwindowsenvironmentsharefilerequestoptions.md)
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFileResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.sharefileasync
     */
    ShareFileAsync(filePath, options) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment3 := IIsolatedWindowsEnvironment3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment3.ShareFileAsync(filePath, options)
    }

    /**
     * **Deprecated.** Share host file with Isolated Windows Environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * 
     * The shared file shall appear in a folder with a randomly generated file path in the Isolated Windows Environment that will be provided in the [IsolatedWindowsEnvironmentShareFileResult](isolatedwindowsenvironmentsharefileresult.md). Any data written to this folder will be copied back to the host. It is recommended to set the AllowWrite flag to false in [IsolatedWindowsEnvironmentShareFileRequestOptions](isolatedwindowsenvironmentsharefilerequestoptions.md) to prevent this.
     * @param {HSTRING} filePath String of host file path.
     * @param {IsolatedWindowsEnvironmentShareFileRequestOptions} options [IsolatedWindowsEnvironmentShareFileRequestOptions](isolatedwindowsenvironmentsharefilerequestoptions.md)
     * @param {IsolatedWindowsEnvironmentTelemetryParameters} telemetryParameters 
     * @returns {IAsyncOperation<IsolatedWindowsEnvironmentShareFileResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.sharefileasync
     */
    ShareFileWithTelemetryAsync(filePath, options, telemetryParameters) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment3")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment3 := IIsolatedWindowsEnvironment3(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment3.ShareFileWithTelemetryAsync(filePath, options, telemetryParameters)
    }

    /**
     * **Deprecated.** Allows the caller to set the execution priority of the isolated environment.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @param {Integer} Priority_ The new execution priority for the environment.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironment.changepriority
     */
    ChangePriority(Priority_) {
        if (!this.HasProp("__IIsolatedWindowsEnvironment4")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironment4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironment4 := IIsolatedWindowsEnvironment4(outPtr)
        }

        return this.__IIsolatedWindowsEnvironment4.ChangePriority(Priority_)
    }

;@endregion Instance Methods
}
