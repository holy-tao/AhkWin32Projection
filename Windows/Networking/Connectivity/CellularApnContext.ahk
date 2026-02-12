#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICellularApnContext.ahk
#Include .\ICellularApnContext2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines properties used to specify an Access Point Name (APN) for a cellular data connection request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class CellularApnContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICellularApnContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICellularApnContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the provider ID associated with the access point.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
        set => this.put_ProviderId(value)
    }

    /**
     * Indicates the name of the access point to establish a connection with.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.accesspointname
     * @type {HSTRING} 
     */
    AccessPointName {
        get => this.get_AccessPointName()
        set => this.put_AccessPointName(value)
    }

    /**
     * Indicates the user name used to authenticate when connecting to the access point.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
        set => this.put_UserName(value)
    }

    /**
     * Indicates the password used to authenticate when connecting to the access point.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.password
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * Indicates if data compression will be used at the data link for header and data transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.iscompressionenabled
     * @type {Boolean} 
     */
    IsCompressionEnabled {
        get => this.get_IsCompressionEnabled()
        set => this.put_IsCompressionEnabled(value)
    }

    /**
     * Specifies the APN authentication method (see [CellularApnAuthenticationType](cellularapnauthenticationtype.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.authenticationtype
     * @type {Integer} 
     */
    AuthenticationType {
        get => this.get_AuthenticationType()
        set => this.put_AuthenticationType(value)
    }

    /**
     * Gets the name of a cellular profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.cellularapncontext.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
        set => this.put_ProfileName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [CellularApnContext](cellularapncontext.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.CellularApnContext")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_ProviderId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProviderId(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_ProviderId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccessPointName() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_AccessPointName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AccessPointName(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_AccessPointName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_UserName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserName(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_UserName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_Password()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Password(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_Password(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompressionEnabled() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_IsCompressionEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompressionEnabled(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_IsCompressionEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationType() {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.get_AuthenticationType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationType(value) {
        if (!this.HasProp("__ICellularApnContext")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext := ICellularApnContext(outPtr)
        }

        return this.__ICellularApnContext.put_AuthenticationType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        if (!this.HasProp("__ICellularApnContext2")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext2 := ICellularApnContext2(outPtr)
        }

        return this.__ICellularApnContext2.get_ProfileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProfileName(value) {
        if (!this.HasProp("__ICellularApnContext2")) {
            if ((queryResult := this.QueryInterface(ICellularApnContext2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICellularApnContext2 := ICellularApnContext2(outPtr)
        }

        return this.__ICellularApnContext2.put_ProfileName(value)
    }

;@endregion Instance Methods
}
