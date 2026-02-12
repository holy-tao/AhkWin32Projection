#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\LaunchUriResult.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\ApplicationModel\AppInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherStatics2
     * @type {Guid}
     */
    static IID => Guid("{59ba2fbb-24cb-4c02-a4c4-8294569d54f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LaunchUriForResultsAsync", "LaunchUriForResultsWithDataAsync", "LaunchUriWithDataAsync", "QueryUriSupportAsync", "QueryUriSupportWithPackageFamilyNameAsync", "QueryFileSupportAsync", "QueryFileSupportWithPackageFamilyNameAsync", "FindUriSchemeHandlersAsync", "FindUriSchemeHandlersWithLaunchUriTypeAsync", "FindFileHandlersAsync"]

    /**
     * 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     */
    LaunchUriForResultsAsync(uri_, options) {
        result := ComCall(6, this, "ptr", uri_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LaunchUriResult, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     */
    LaunchUriForResultsWithDataAsync(uri_, options, inputData) {
        result := ComCall(7, this, "ptr", uri_, "ptr", options, "ptr", inputData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LaunchUriResult, operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Boolean>} 
     */
    LaunchUriWithDataAsync(uri_, options, inputData) {
        result := ComCall(8, this, "ptr", uri_, "ptr", options, "ptr", inputData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {Integer} launchQuerySupportType_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryUriSupportAsync(uri_, launchQuerySupportType_) {
        result := ComCall(9, this, "ptr", uri_, "int", launchQuerySupportType_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {Integer} launchQuerySupportType_ 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryUriSupportWithPackageFamilyNameAsync(uri_, launchQuerySupportType_, packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(10, this, "ptr", uri_, "int", launchQuerySupportType_, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {StorageFile} file_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryFileSupportAsync(file_) {
        result := ComCall(11, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {StorageFile} file_ 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryFileSupportWithPackageFamilyNameAsync(file_, packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(12, this, "ptr", file_, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} scheme 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     */
    FindUriSchemeHandlersAsync(scheme) {
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme

        result := ComCall(13, this, "ptr", scheme, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInfo), operation)
    }

    /**
     * 
     * @param {HSTRING} scheme 
     * @param {Integer} launchQuerySupportType_ 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     */
    FindUriSchemeHandlersWithLaunchUriTypeAsync(scheme, launchQuerySupportType_) {
        if(scheme is String) {
            pin := HSTRING.Create(scheme)
            scheme := pin.Value
        }
        scheme := scheme is Win32Handle ? NumGet(scheme, "ptr") : scheme

        result := ComCall(14, this, "ptr", scheme, "int", launchQuerySupportType_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInfo), operation)
    }

    /**
     * 
     * @param {HSTRING} extension_ 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     */
    FindFileHandlersAsync(extension_) {
        if(extension_ is String) {
            pin := HSTRING.Create(extension_)
            extension_ := pin.Value
        }
        extension_ := extension_ is Win32Handle ? NumGet(extension_, "ptr") : extension_

        result := ComCall(15, this, "ptr", extension_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInfo), operation)
    }
}
