#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Cortana
 * @version WindowsRuntime 1.4
 */
class ICortanaActionableInsights extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICortanaActionableInsights
     * @type {Guid}
     */
    static IID => Guid("{951ec6b1-fc83-586d-8b84-2452c8981625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "IsAvailableAsync", "ShowInsightsForImageAsync", "ShowInsightsForImageWithOptionsAsync", "ShowInsightsForTextAsync", "ShowInsightsForTextWithOptionsAsync", "ShowInsightsAsync", "ShowInsightsWithOptionsAsync"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsAvailableAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} imageStream_ 
     * @returns {IAsyncAction} 
     */
    ShowInsightsForImageAsync(imageStream_) {
        result := ComCall(8, this, "ptr", imageStream_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} imageStream_ 
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     */
    ShowInsightsForImageWithOptionsAsync(imageStream_, options) {
        result := ComCall(9, this, "ptr", imageStream_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {IAsyncAction} 
     */
    ShowInsightsForTextAsync(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(10, this, "ptr", text, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     */
    ShowInsightsForTextWithOptionsAsync(text, options) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(11, this, "ptr", text, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {DataPackage} datapackage_ 
     * @returns {IAsyncAction} 
     */
    ShowInsightsAsync(datapackage_) {
        result := ComCall(12, this, "ptr", datapackage_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {DataPackage} datapackage_ 
     * @param {CortanaActionableInsightsOptions} options 
     * @returns {IAsyncAction} 
     */
    ShowInsightsWithOptionsAsync(datapackage_, options) {
        result := ComCall(13, this, "ptr", datapackage_, "ptr", options, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
