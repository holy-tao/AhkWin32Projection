#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskQueryOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the options selected for task query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskqueryoptions
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskQueryOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value indicating whether the query results should be sorted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskqueryoptions.sortproperty
     * @type {Integer} 
     */
    SortProperty {
        get => this.get_SortProperty()
        set => this.put_SortProperty(value)
    }

    /**
     * Gets or sets the kind of tasks for which to query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskqueryoptions.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new instance of the [UserDataTaskQueryOptions](userdatataskqueryoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTaskQueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SortProperty() {
        if (!this.HasProp("__IUserDataTaskQueryOptions")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskQueryOptions := IUserDataTaskQueryOptions(outPtr)
        }

        return this.__IUserDataTaskQueryOptions.get_SortProperty()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SortProperty(value) {
        if (!this.HasProp("__IUserDataTaskQueryOptions")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskQueryOptions := IUserDataTaskQueryOptions(outPtr)
        }

        return this.__IUserDataTaskQueryOptions.put_SortProperty(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IUserDataTaskQueryOptions")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskQueryOptions := IUserDataTaskQueryOptions(outPtr)
        }

        return this.__IUserDataTaskQueryOptions.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IUserDataTaskQueryOptions")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskQueryOptions := IUserDataTaskQueryOptions(outPtr)
        }

        return this.__IUserDataTaskQueryOptions.put_Kind(value)
    }

;@endregion Instance Methods
}
