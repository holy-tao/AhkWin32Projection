#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILauncherStatics2.ahk
#Include .\ILauncherStatics.ahk
#Include .\ILauncherStatics4.ahk
#Include .\ILauncherStatics5.ahk
#Include .\ILauncherStatics3.ahk
#Include ..\..\Guid.ahk

/**
 * Starts the default app associated with the specified file or URI.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.system.launcher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class Launcher extends IInspectable {
;@region Static Methods
    /**
     * Asynchronously starts the default app associated with the URI scheme name for the specified URI, using the specified options and input data.
     * @remarks
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as the UI thread).
     * 
     * This API may also be called from a Windows desktop application.
     * 
     * Launching an app for results allows you to launch an app from another app and exchange data between the two.
     * 
     * When calling this method, the *options* parameter must contain a valid value for [LauncherOptions.TargetApplicationPackageFamilyName](launcheroptions_targetapplicationpackagefamilyname.md).
     * 
     * When calling **LaunchUriForResultsAsync** to launch a UWP app, the [OnActivated](/uwp/api/windows.ui.xaml.application.onactivated) method in the app that's launched will be invoked on a background thread, not the UI thread. Developers should ensure that any UI updates or interactions are marshaled to the UI thread appropriately.
     * @param {Uri} uri_ The Uri to launch.
     * @param {LauncherOptions} options The launch options.
     * @returns {IAsyncOperation<LaunchUriResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforresultsasync
     */
    static LaunchUriForResultsAsync(uri_, options) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.LaunchUriForResultsAsync(uri_, options)
    }

    /**
     * Asynchronously starts the default app associated with the URI scheme name for the specified URI, using the specified options.
     * @remarks
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as the UI thread).
     * 
     * This API may also be called from a Windows desktop application.
     * 
     * Launching an app for results allows you to launch an app from another app and exchange data between the two.
     * 
     * When calling this method, the *options* parameter must contain a valid value for [LauncherOptions.TargetApplicationPackageFamilyName](launcheroptions_targetapplicationpackagefamilyname.md).
     * 
     * When calling **LaunchUriForResultsAsync** to launch a UWP app, the [OnActivated](/uwp/api/windows.ui.xaml.application.onactivated) method in the app that's launched will be invoked on a background thread, not the UI thread. Developers should ensure that any UI updates or interactions are marshaled to the UI thread appropriately.
     * @param {Uri} uri_ The Uri to launch.
     * @param {LauncherOptions} options The launch options.
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforresultsasync
     */
    static LaunchUriForResultsWithDataAsync(uri_, options, inputData) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.LaunchUriForResultsWithDataAsync(uri_, options, inputData)
    }

    /**
     * Starts the default app associated with the URI scheme name for the specified URI.
     * @remarks
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as the UI thread).
     * 
     * This API may also be called from a Windows desktop application.
     * 
     * This API launches the default app for the scheme whether it be a Universal Windows Platform (UWP) app or Windows desktop application.
     * 
     * The calling app must be visible to the user when the API is invoked.
     * 
     * You must specify the **privateNetworkClientServer** capability in the manifest in order to launch intranet URIs, for example a file:/// URI pointing to a network location.
     * 
     * You cannot use this method to launch a URI in the local zone. For example, apps cannot use the **file:////* protocol to access files on the local computer. Instead, you must use the [Storage APIs](../windows.storage/windows_storage.md) to access files.
     * 
     * When the launch fails for any of the above reasons, the API will succeed and return FALSE from its asynchronous operation.
     * 
     * To enable the user to choose an app instead of launching the default app, set the [LauncherOptions.DisplayApplicationPicker](launcheroptions_displayapplicationpicker.md) property.
     * 
     * To display a warning that the URI is potentially unsafe, set the [LauncherOptions.TreatAsUntrusted](launcheroptions_treatasuntrusted.md) property.
     * 
     * The URI is passed to the associated app. If the associated app is a desktop app, the URI is passed using shell execution mechanisms.
     * @param {Uri} uri_ The URI.
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriasync
     */
    static LaunchUriWithDataAsync(uri_, options, inputData) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.LaunchUriWithDataAsync(uri_, options, inputData)
    }

    /**
     * Asynchronously query whether an app can be activated for the specified URI, launch type, and package name.
     * @remarks
     * This API may also be called from Windows desktop application.
     * 
     * Both Windows desktop application and Universal Windows Platform (UWP) app are considered.
     * @param {Uri} uri_ The URI for which to query support.
     * @param {Integer} launchQuerySupportType_ The type of launch for which to query support.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryurisupportasync
     */
    static QueryUriSupportAsync(uri_, launchQuerySupportType_) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.QueryUriSupportAsync(uri_, launchQuerySupportType_)
    }

    /**
     * Asynchronously query whether an app can be activated for the specified URI and launch type.
     * @remarks
     * This API may also be called from Windows desktop application.
     * 
     * Both Windows desktop application and Universal Windows Platform (UWP) app are considered.
     * @param {Uri} uri_ The URI for which to query support.
     * @param {Integer} launchQuerySupportType_ The type of launch for which to query support.
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryurisupportasync
     */
    static QueryUriSupportWithPackageFamilyNameAsync(uri_, launchQuerySupportType_, packageFamilyName) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.QueryUriSupportWithPackageFamilyNameAsync(uri_, launchQuerySupportType_, packageFamilyName)
    }

    /**
     * Asynchronously query whether an app with the specified package name can be activated for the specified file.
     * @remarks
     * This API may also be called from Windows desktop application.
     * 
     * Both Windows desktop application and Universal Windows Platform (UWP) app are considered.
     * @param {StorageFile} file_ The file for which to query support.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryfilesupportasync
     */
    static QueryFileSupportAsync(file_) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.QueryFileSupportAsync(file_)
    }

    /**
     * Asynchronously query whether an app can be activated for the specified file.
     * @remarks
     * This API may also be called from Windows desktop application.
     * 
     * Both Windows desktop application and Universal Windows Platform (UWP) app are considered.
     * @param {StorageFile} file_ The file for which to query support.
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryfilesupportasync
     */
    static QueryFileSupportWithPackageFamilyNameAsync(file_, packageFamilyName) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.QueryFileSupportWithPackageFamilyNameAsync(file_, packageFamilyName)
    }

    /**
     * Enumerate the scheme handlers on the device.
     * @remarks
     * This API may also be called from Windows desktop application but does not return Windows desktop application.
     * @param {HSTRING} scheme The scheme name that you find to find handlers for. For example, "ms-lens".
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.findurischemehandlersasync
     */
    static FindUriSchemeHandlersAsync(scheme) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.FindUriSchemeHandlersAsync(scheme)
    }

    /**
     * Enumerate the scheme handlers on the device.
     * @remarks
     * This API may also be called from Windows desktop application but does not return Windows desktop application.
     * @param {HSTRING} scheme The scheme name that you want to find handlers for. For example, "ms-lens".
     * @param {Integer} launchQuerySupportType_ 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.findurischemehandlersasync
     */
    static FindUriSchemeHandlersWithLaunchUriTypeAsync(scheme, launchQuerySupportType_) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.FindUriSchemeHandlersWithLaunchUriTypeAsync(scheme, launchQuerySupportType_)
    }

    /**
     * Enumerate the file handlers on the device.
     * @remarks
     * This API may also be called from Windows desktop application but does not return Windows desktop application.
     * @param {HSTRING} extension_ The file extension that you want to find handlers for. For example, ".bat". Include the leading period '.'.
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.findfilehandlersasync
     */
    static FindFileHandlersAsync(extension_) {
        if (!Launcher.HasProp("__ILauncherStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics2.IID)
            Launcher.__ILauncherStatics2 := ILauncherStatics2(factoryPtr)
        }

        return Launcher.__ILauncherStatics2.FindFileHandlersAsync(extension_)
    }

    /**
     * Starts the default app associated with the specified file, using the specified options.
     * @remarks
     * The calling app must be visible to the user when the API is invoked.
     * 
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * 
     * This API also imposes several restrictions on what types of files it can launch. Many file types that contain executable code, for example .exe, .msi, and .js files, are blocked from launching. This restriction protects users from potentially malicious files that could modify the system.
     * 
     * When the launch fails for any of the above reasons, the API succeeds and returns FALSE from its asynchronous operation. Since it has no ability to query whether the above restrictions apply to the current launch, the calling app should not assume that the launch succeeded, and should provide fallback mechanism in case it failed. A possible solution would be to ask the user to save the file and direct the user to open it in the desktop. 
     * 
     * To enable the user to choose an app instead of launching the default app, set the [LauncherOptions.DisplayApplicationPicker](launcheroptions_displayapplicationpicker.md) property.
     * 
     * To display a warning that the file is potentially unsafe, set the [LauncherOptions.TreatAsUntrusted](launcheroptions_treatasuntrusted.md) property.
     * 
     * The file is passed to the associated app. If the associated app is a desktop app, the file is passed using shell execution mechanisms.
     * @param {IStorageFile} file_ The file.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfileasync
     */
    static LaunchFileAsync(file_) {
        if (!Launcher.HasProp("__ILauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics.IID)
            Launcher.__ILauncherStatics := ILauncherStatics(factoryPtr)
        }

        return Launcher.__ILauncherStatics.LaunchFileAsync(file_)
    }

    /**
     * Starts the default app associated with the specified file.
     * @remarks
     * The calling app must be visible to the user when the API is invoked.
     * 
     * This API must be called from an ASTA thread (also known as a UI thread).
     * 
     * This API also imposes several restrictions on what types of files it can launch. Many file types that contain executable code, for example .exe, .msi, and .js files, are blocked from launching. This restriction protects users from potentially malicious files that could modify the system.
     * 
     * When the launch fails for any of the above reasons, the API succeeds and returns FALSE from its asynchronous operation. Since it has no ability to query whether the above restrictions apply to the current launch, the calling app should not assume that the launch succeeded, and should provide fallback mechanism in case it failed. A possible solution would be to ask the user to save the file and direct the user to open it in the desktop. 
     * 
     * To enable the user to choose an app instead of launching the default app, set the [LauncherOptions.DisplayApplicationPicker](launcheroptions_displayapplicationpicker.md) property.
     * 
     * To display a warning that the file is potentially unsafe, set the [LauncherOptions.TreatAsUntrusted](launcheroptions_treatasuntrusted.md) property.
     * 
     * The file is passed to the associated app. If the associated app is a desktop app, the file is passed using shell execution mechanisms.
     * @param {IStorageFile} file_ The file.
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfileasync
     */
    static LaunchFileWithOptionsAsync(file_, options) {
        if (!Launcher.HasProp("__ILauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics.IID)
            Launcher.__ILauncherStatics := ILauncherStatics(factoryPtr)
        }

        return Launcher.__ILauncherStatics.LaunchFileWithOptionsAsync(file_, options)
    }

    /**
     * Starts the default app associated with the URI scheme name or the one specified by the [ContentType](launcheroptions_contenttype.md) for the specified URI, using the specified options.
     * @remarks
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as the UI thread).
     * 
     * This API may also be called from a Windows desktop application.
     * 
     * This API launches the default app for the scheme whether it be a Universal Windows Platform (UWP) app or Windows desktop application.
     * 
     * The calling app must be visible to the user when this API is invoked.
     * 
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as a UI thread).
     * 
     * You must specify the **privateNetworkClientServer** capability in the manifest in order to launch intranet URIs, for example a file:/// URI pointing to a network location.
     * 
     * You cannot use this method to launch a URI in the local zone. For example, apps cannot use the **file:////* protocol to access files on the local computer. Instead, you must use the [Storage APIs](../windows.storage/windows_storage.md) to access files.
     * 
     * The content type is used to compute a file extension, from the extension the default app is chosen. For example a content type value of ""application/vnd.ms-word.document.12"" is mapped to ".docx" and then the default application for ".docx" is launched. For example:
     * 
     * ```csharp
     * 
     * // this specifies the file type, which is used to bind to Word. 
     * launcherOptions.ContentType = "application/vnd.ms-word.document.12"; 
     * // and then this launches the file using the application
     * Launcher.LaunchUriAsync("http://www.cloud.com/file.docx", options);
     * ```
     * 
     * When the launch fails for any of the above reasons, the API will succeed and return FALSE from its asynchronous operation.
     * 
     * To enable the user to choose an app instead of launching the default app, set the [LauncherOptions.DisplayApplicationPicker](launcheroptions_displayapplicationpicker.md) property.
     * 
     * To display a warning that the URI is potentially unsafe, set the [LauncherOptions.TreatAsUntrusted](launcheroptions_treatasuntrusted.md) property.
     * 
     * The URI is passed to the associated app. If the associated app is a desktop app, the URI is passed using shell execution mechanisms.
     * @param {Uri} uri_ The URI.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriasync
     */
    static LaunchUriAsync(uri_) {
        if (!Launcher.HasProp("__ILauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics.IID)
            Launcher.__ILauncherStatics := ILauncherStatics(factoryPtr)
        }

        return Launcher.__ILauncherStatics.LaunchUriAsync(uri_)
    }

    /**
     * Starts the default app associated with the URI scheme name for the specified URI, using the specified options and input data.
     * @remarks
     * Unless you are calling this API from a Windows desktop application, this API must be called from within an ASTA thread (also known as the UI thread).
     * 
     * This API may also be called from a Windows desktop application.
     * 
     * This API launches the default app for the scheme whether it be a Universal Windows Platform (UWP) app or Windows desktop application.
     * @param {Uri} uri_ The URI.
     * @param {LauncherOptions} options The launch options for the app.
     * 
     * > [!IMPORTANT]
     * > The [TargetApplicationPackageFamilyName](launcheroptions_targetapplicationpackagefamilyname.md) property of the *options* parameter, while sometimes optional, is required for this overload of the **LaunchUriAsync** method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriasync
     */
    static LaunchUriWithOptionsAsync(uri_, options) {
        if (!Launcher.HasProp("__ILauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics.IID)
            Launcher.__ILauncherStatics := ILauncherStatics(factoryPtr)
        }

        return Launcher.__ILauncherStatics.LaunchUriWithOptionsAsync(uri_, options)
    }

    /**
     * Asynchronously query whether the specified app can handle the specified URI.
     * @remarks
     * Windows desktop application are not considered.
     * @param {Uri} uri_ The URI of the website.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryappurisupportasync
     */
    static QueryAppUriSupportAsync(uri_) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.QueryAppUriSupportAsync(uri_)
    }

    /**
     * Asynchronously query whether there is an app that can handle the specified URI.
     * @remarks
     * Windows desktop application are not considered.
     * @param {Uri} uri_ The URI of the website.
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.queryappurisupportasync
     */
    static QueryAppUriSupportWithPackageFamilyNameAsync(uri_, packageFamilyName) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.QueryAppUriSupportWithPackageFamilyNameAsync(uri_, packageFamilyName)
    }

    /**
     * Enumerate the Uniform Resource Identifiers (URI) handlers on the device.
     * @remarks
     * This API may also be called from Windows desktop application but does not return Windows desktop application.
     * @param {Uri} uri_ The Uri that you want to find handlers for.
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.findappurihandlersasync
     */
    static FindAppUriHandlersAsync(uri_) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.FindAppUriHandlersAsync(uri_)
    }

    /**
     * Starts the default multi-user app associated with the URI scheme name for the specified URI using the specified options, and provides a specific [User](user.md) as context.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {Uri} uri_ The URI scheme.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforuserasync
     */
    static LaunchUriForUserAsync(user_, uri_) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.LaunchUriForUserAsync(user_, uri_)
    }

    /**
     * Starts the default multi-user app associated with the URI scheme name for the specified URI, using the specified options and input data, and provides a specific [User](user.md) as context.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {Uri} uri_ The URI scheme.
     * @param {LauncherOptions} options The launch options for the app.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforuserasync
     */
    static LaunchUriWithOptionsForUserAsync(user_, uri_, options) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.LaunchUriWithOptionsForUserAsync(user_, uri_, options)
    }

    /**
     * Starts the default multi-user app associated with the URI scheme name for the specified URI and provides a specific [User](user.md) as context.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {Uri} uri_ The URI scheme.
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforuserasync
     */
    static LaunchUriWithDataForUserAsync(user_, uri_, options, inputData) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.LaunchUriWithDataForUserAsync(user_, uri_, options, inputData)
    }

    /**
     * Asynchronously starts the default app associated with the URI scheme name for the specified URI using the specified options and input data, and provides a specific [User](user.md) as context.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {Uri} uri_ The Uri.
     * @param {LauncherOptions} options The launch options.
     * @returns {IAsyncOperation<LaunchUriResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforresultsforuserasync
     */
    static LaunchUriForResultsForUserAsync(user_, uri_, options) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.LaunchUriForResultsForUserAsync(user_, uri_, options)
    }

    /**
     * Asynchronously starts the default app associated with the URI scheme name for the specified URI using the specified options, and provides a specific [User](user.md) as context.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {Uri} uri_ The Uri.
     * @param {LauncherOptions} options The launch options.
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchuriforresultsforuserasync
     */
    static LaunchUriForResultsWithDataForUserAsync(user_, uri_, options, inputData) {
        if (!Launcher.HasProp("__ILauncherStatics4")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics4.IID)
            Launcher.__ILauncherStatics4 := ILauncherStatics4(factoryPtr)
        }

        return Launcher.__ILauncherStatics4.LaunchUriForResultsWithDataForUserAsync(user_, uri_, options, inputData)
    }

    /**
     * Launches File Explorer with the specified options and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * This API does not require the calling app to have access to the folder being launched.
     * This API will fail if the path does not point to a folder, or the user does not have access to that folder.
     * @param {HSTRING} path_ A filepath to the folder to open.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderpathasync
     */
    static LaunchFolderPathAsync(path_) {
        if (!Launcher.HasProp("__ILauncherStatics5")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics5.IID)
            Launcher.__ILauncherStatics5 := ILauncherStatics5(factoryPtr)
        }

        return Launcher.__ILauncherStatics5.LaunchFolderPathAsync(path_)
    }

    /**
     * Launches File Explorer and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * This API does not require the calling app to have access to the folder being launched.
     * This API will fail if the path does not point to a folder, or the user does not have access to that folder.
     * @param {HSTRING} path_ A filepath to the folder to open.
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderpathasync
     */
    static LaunchFolderPathWithOptionsAsync(path_, options) {
        if (!Launcher.HasProp("__ILauncherStatics5")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics5.IID)
            Launcher.__ILauncherStatics5 := ILauncherStatics5(factoryPtr)
        }

        return Launcher.__ILauncherStatics5.LaunchFolderPathWithOptionsAsync(path_, options)
    }

    /**
     * Launches File Explorer with the specified options and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * This API does not require the calling app to have access to the folder being launched.
     * This API will fail if the path does not point to a folder, or the user does not have access to that folder.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {HSTRING} path_ A filepath to the folder to open.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderpathforuserasync
     */
    static LaunchFolderPathForUserAsync(user_, path_) {
        if (!Launcher.HasProp("__ILauncherStatics5")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics5.IID)
            Launcher.__ILauncherStatics5 := ILauncherStatics5(factoryPtr)
        }

        return Launcher.__ILauncherStatics5.LaunchFolderPathForUserAsync(user_, path_)
    }

    /**
     * Launches File Explorer and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * This API does not require the calling app to have access to the folder being launched.
     * This API will fail if the path does not point to a folder, or the user does not have access to that folder.
     * @param {User} user_ The user context to pass to the launched app.
     * @param {HSTRING} path_ A filepath to the folder to open.
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderpathforuserasync
     */
    static LaunchFolderPathWithOptionsForUserAsync(user_, path_, options) {
        if (!Launcher.HasProp("__ILauncherStatics5")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics5.IID)
            Launcher.__ILauncherStatics5 := ILauncherStatics5(factoryPtr)
        }

        return Launcher.__ILauncherStatics5.LaunchFolderPathWithOptionsForUserAsync(user_, path_, options)
    }

    /**
     * Launches File Explorer with the specified options and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * @param {IStorageFolder} folder_ The folder to display in File Explorer.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderasync
     */
    static LaunchFolderAsync(folder_) {
        if (!Launcher.HasProp("__ILauncherStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics3.IID)
            Launcher.__ILauncherStatics3 := ILauncherStatics3(factoryPtr)
        }

        return Launcher.__ILauncherStatics3.LaunchFolderAsync(folder_)
    }

    /**
     * Launches File Explorer and displays the contents of the specified folder.
     * @remarks
     * This API must be called from within an ASTA thread (also known as a UI thread).
     * @param {IStorageFolder} folder_ The folder to display in File Explorer.
     * @param {FolderLauncherOptions} options 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.launcher.launchfolderasync
     */
    static LaunchFolderWithOptionsAsync(folder_, options) {
        if (!Launcher.HasProp("__ILauncherStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.Launcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILauncherStatics3.IID)
            Launcher.__ILauncherStatics3 := ILauncherStatics3(factoryPtr)
        }

        return Launcher.__ILauncherStatics3.LaunchFolderWithOptionsAsync(folder_, options)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
