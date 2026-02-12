#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateCredential.ahk
#Include .\IUpdateCredentialFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateCredential extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateCredential

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateCredential.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} status_ 
     * @param {HSTRING} userName 
     * @param {HSTRING} password 
     * @returns {UpdateCredential} 
     */
    static CreateInstance(status_, userName, password) {
        if (!UpdateCredential.HasProp("__IUpdateCredentialFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateCredential")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateCredentialFactory.IID)
            UpdateCredential.__IUpdateCredentialFactory := IUpdateCredentialFactory(factoryPtr)
        }

        return UpdateCredential.__IUpdateCredentialFactory.CreateInstance(status_, userName, password)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
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
    get_Status() {
        if (!this.HasProp("__IUpdateCredential")) {
            if ((queryResult := this.QueryInterface(IUpdateCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateCredential := IUpdateCredential(outPtr)
        }

        return this.__IUpdateCredential.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        if (!this.HasProp("__IUpdateCredential")) {
            if ((queryResult := this.QueryInterface(IUpdateCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateCredential := IUpdateCredential(outPtr)
        }

        return this.__IUpdateCredential.get_UserName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        if (!this.HasProp("__IUpdateCredential")) {
            if ((queryResult := this.QueryInterface(IUpdateCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateCredential := IUpdateCredential(outPtr)
        }

        return this.__IUpdateCredential.get_Password()
    }

;@endregion Instance Methods
}
