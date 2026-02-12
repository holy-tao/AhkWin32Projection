#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\ApplicationModel\AppInfo.ahk
#Include .\LaunchUriResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherStatics4
     * @type {Guid}
     */
    static IID => Guid("{b9ec819f-b5a5-41c6-b3b3-dd1b3178bcf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryAppUriSupportAsync", "QueryAppUriSupportWithPackageFamilyNameAsync", "FindAppUriHandlersAsync", "LaunchUriForUserAsync", "LaunchUriWithOptionsForUserAsync", "LaunchUriWithDataForUserAsync", "LaunchUriForResultsForUserAsync", "LaunchUriForResultsWithDataForUserAsync"]

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryAppUriSupportAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<Integer>} 
     */
    QueryAppUriSupportWithPackageFamilyNameAsync(uri_, packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(7, this, "ptr", uri_, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<IVectorView<AppInfo>>} 
     */
    FindAppUriHandlersAsync(uri_) {
        result := ComCall(8, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInfo), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriForUserAsync(user_, uri_) {
        result := ComCall(9, this, "ptr", user_, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriWithOptionsForUserAsync(user_, uri_, options) {
        result := ComCall(10, this, "ptr", user_, "ptr", uri_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Integer>} 
     */
    LaunchUriWithDataForUserAsync(user_, uri_, options, inputData) {
        result := ComCall(11, this, "ptr", user_, "ptr", uri_, "ptr", options, "ptr", inputData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     */
    LaunchUriForResultsForUserAsync(user_, uri_, options) {
        result := ComCall(12, this, "ptr", user_, "ptr", uri_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LaunchUriResult, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {Uri} uri_ 
     * @param {LauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<LaunchUriResult>} 
     */
    LaunchUriForResultsWithDataForUserAsync(user_, uri_, options, inputData) {
        result := ComCall(13, this, "ptr", user_, "ptr", uri_, "ptr", options, "ptr", inputData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LaunchUriResult, operation)
    }
}
