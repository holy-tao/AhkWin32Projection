#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredentialCacheConfiguration.ahk
#Include .\IKeyCredentialCacheConfigurationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialCacheConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyCredentialCacheConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyCredentialCacheConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} cacheOption 
     * @param {TimeSpan} timeout 
     * @param {Integer} usageCount 
     * @returns {KeyCredentialCacheConfiguration} 
     */
    static CreateInstance(cacheOption, timeout, usageCount) {
        if (!KeyCredentialCacheConfiguration.HasProp("__IKeyCredentialCacheConfigurationFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialCacheConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialCacheConfigurationFactory.IID)
            KeyCredentialCacheConfiguration.__IKeyCredentialCacheConfigurationFactory := IKeyCredentialCacheConfigurationFactory(factoryPtr)
        }

        return KeyCredentialCacheConfiguration.__IKeyCredentialCacheConfigurationFactory.CreateInstance(cacheOption, timeout, usageCount)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    CacheOption {
        get => this.get_CacheOption()
    }

    /**
     * @type {TimeSpan} 
     */
    Timeout {
        get => this.get_Timeout()
    }

    /**
     * @type {Integer} 
     */
    UsageCount {
        get => this.get_UsageCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CacheOption() {
        if (!this.HasProp("__IKeyCredentialCacheConfiguration")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialCacheConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialCacheConfiguration := IKeyCredentialCacheConfiguration(outPtr)
        }

        return this.__IKeyCredentialCacheConfiguration.get_CacheOption()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Timeout() {
        if (!this.HasProp("__IKeyCredentialCacheConfiguration")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialCacheConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialCacheConfiguration := IKeyCredentialCacheConfiguration(outPtr)
        }

        return this.__IKeyCredentialCacheConfiguration.get_Timeout()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageCount() {
        if (!this.HasProp("__IKeyCredentialCacheConfiguration")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialCacheConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialCacheConfiguration := IKeyCredentialCacheConfiguration(outPtr)
        }

        return this.__IKeyCredentialCacheConfiguration.get_UsageCount()
    }

;@endregion Instance Methods
}
