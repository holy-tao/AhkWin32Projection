#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEnterpriseKeyCredentialRegistrationManager.ahk
#Include .\IEnterpriseKeyCredentialRegistrationManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to information about enterprise key credential registrations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationmanager
 * @namespace Windows.Security.Authentication.Identity
 * @version WindowsRuntime 1.4
 */
class EnterpriseKeyCredentialRegistrationManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEnterpriseKeyCredentialRegistrationManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEnterpriseKeyCredentialRegistrationManager.IID

    /**
     * Gets the current enterprise key credential registration manager.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationmanager.current
     * @type {EnterpriseKeyCredentialRegistrationManager} 
     */
    static Current {
        get => EnterpriseKeyCredentialRegistrationManager.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {EnterpriseKeyCredentialRegistrationManager} 
     */
    static get_Current() {
        if (!EnterpriseKeyCredentialRegistrationManager.HasProp("__IEnterpriseKeyCredentialRegistrationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.EnterpriseKeyCredentialRegistrationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEnterpriseKeyCredentialRegistrationManagerStatics.IID)
            EnterpriseKeyCredentialRegistrationManager.__IEnterpriseKeyCredentialRegistrationManagerStatics := IEnterpriseKeyCredentialRegistrationManagerStatics(factoryPtr)
        }

        return EnterpriseKeyCredentialRegistrationManager.__IEnterpriseKeyCredentialRegistrationManagerStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the enterprise key credential registrations.
     * @returns {IAsyncOperation<IVectorView<EnterpriseKeyCredentialRegistrationInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.enterprisekeycredentialregistrationmanager.getregistrationsasync
     */
    GetRegistrationsAsync() {
        if (!this.HasProp("__IEnterpriseKeyCredentialRegistrationManager")) {
            if ((queryResult := this.QueryInterface(IEnterpriseKeyCredentialRegistrationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnterpriseKeyCredentialRegistrationManager := IEnterpriseKeyCredentialRegistrationManager(outPtr)
        }

        return this.__IEnterpriseKeyCredentialRegistrationManager.GetRegistrationsAsync()
    }

;@endregion Instance Methods
}
