#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateManagerScanOptions.ahk
#Include .\IWindowsUpdateManagerScanOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateManagerScanOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateManagerScanOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateManagerScanOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Boolean} isUserInitiated 
     * @returns {WindowsUpdateManagerScanOptions} 
     */
    static CreateInstance(isUserInitiated) {
        if (!WindowsUpdateManagerScanOptions.HasProp("__IWindowsUpdateManagerScanOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateManagerScanOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateManagerScanOptionsFactory.IID)
            WindowsUpdateManagerScanOptions.__IWindowsUpdateManagerScanOptionsFactory := IWindowsUpdateManagerScanOptionsFactory(factoryPtr)
        }

        return WindowsUpdateManagerScanOptions.__IWindowsUpdateManagerScanOptionsFactory.CreateInstance(isUserInitiated)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    IsUserInitiated {
        get => this.get_IsUserInitiated()
        set => this.put_IsUserInitiated(value)
    }

    /**
     * @type {Boolean} 
     */
    AllowBypassThrottling {
        get => this.get_AllowBypassThrottling()
        set => this.put_AllowBypassThrottling(value)
    }

    /**
     * @type {Boolean} 
     */
    PerformUpdateActions {
        get => this.get_PerformUpdateActions()
        set => this.put_PerformUpdateActions(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateManagerScanOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserInitiated() {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.get_IsUserInitiated()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsUserInitiated(value) {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.put_IsUserInitiated(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowBypassThrottling() {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.get_AllowBypassThrottling()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowBypassThrottling(value) {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.put_AllowBypassThrottling(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PerformUpdateActions() {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.get_PerformUpdateActions()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PerformUpdateActions(value) {
        if (!this.HasProp("__IWindowsUpdateManagerScanOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManagerScanOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManagerScanOptions := IWindowsUpdateManagerScanOptions(outPtr)
        }

        return this.__IWindowsUpdateManagerScanOptions.put_PerformUpdateActions(value)
    }

;@endregion Instance Methods
}
