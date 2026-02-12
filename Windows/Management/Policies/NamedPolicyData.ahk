#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INamedPolicyData.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\NamedPolicyData.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Policy data information for mobile device management.
 * @remarks
 * Policy values can be several types, some of which include: integers, strings, booleans, and binaries. Note that each policy supports one data type, and the policy data type cannot change once it's defined.
 * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata
 * @namespace Windows.Management.Policies
 * @version WindowsRuntime 1.4
 */
class NamedPolicyData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INamedPolicyData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INamedPolicyData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the MDM policy area name.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.area
     * @type {HSTRING} 
     */
    Area {
        get => this.get_Area()
    }

    /**
     * Gets the MDM policy name value.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the type of the MDM policy value.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Determines whether an MDM policy is actively managed or not.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.ismanaged
     * @type {Boolean} 
     */
    IsManaged {
        get => this.get_IsManaged()
    }

    /**
     * Determines whether an MDM policy is a user policy or not.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.isuserpolicy
     * @type {Boolean} 
     */
    IsUserPolicy {
        get => this.get_IsUserPolicy()
    }

    /**
     * Gets the user's data for the MDM user policy.
     * @remarks
     * This is only valid for user MDM policies.
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Occurs when the MDM policy is changed.
     * @remarks
     * To determine any individual MDM policy's state, the developer must requery any policy in the policy area.
     * @type {TypedEventHandler<NamedPolicyData, IInspectable>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{791a3c00-5aa2-5f0e-bb17-3480bc2d96cc}"),
                    NamedPolicyData,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Area() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_Area()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_Kind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsManaged() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_IsManaged()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserPolicy() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_IsUserPolicy()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.get_User()
    }

    /**
     * Gets the boolean representation of the MDM policy value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.getboolean
     */
    GetBoolean() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.GetBoolean()
    }

    /**
     * Gets the binary representation of the MDM policy value.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.getbinary
     */
    GetBinary() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.GetBinary()
    }

    /**
     * Gets the 32 bit integer representation of the MDM policy value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.getint32
     */
    GetInt32() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.GetInt32()
    }

    /**
     * Gets the 64 bit integer representation of the MDM policy value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.getint64
     */
    GetInt64() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.GetInt64()
    }

    /**
     * Gets the string representation of the MDM policy value.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.policies.namedpolicydata.getstring
     */
    GetString() {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.GetString()
    }

    /**
     * 
     * @param {TypedEventHandler<NamedPolicyData, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(changedHandler) {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.add_Changed(changedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Changed(cookie) {
        if (!this.HasProp("__INamedPolicyData")) {
            if ((queryResult := this.QueryInterface(INamedPolicyData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INamedPolicyData := INamedPolicyData(outPtr)
        }

        return this.__INamedPolicyData.remove_Changed(cookie)
    }

;@endregion Instance Methods
}
