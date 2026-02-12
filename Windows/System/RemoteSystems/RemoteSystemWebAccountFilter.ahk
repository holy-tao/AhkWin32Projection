#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemWebAccountFilter.ahk
#Include .\IRemoteSystemWebAccountFilterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * An [IRemoteSystemFilter](iremotesystemfilter.md) that limits the set of discoverable remote systems by allowing only those which are signed in with a certain web account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwebaccountfilter
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemWebAccountFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemWebAccountFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemWebAccountFilter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [RemoteSystemWebAccountFilter](RemoteSystemWebAccountFilter.md) class.
     * @param {WebAccount} account The web account to target.
     * @returns {RemoteSystemWebAccountFilter} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwebaccountfilter.#ctor
     */
    static Create(account) {
        if (!RemoteSystemWebAccountFilter.HasProp("__IRemoteSystemWebAccountFilterFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteSystems.RemoteSystemWebAccountFilter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteSystemWebAccountFilterFactory.IID)
            RemoteSystemWebAccountFilter.__IRemoteSystemWebAccountFilterFactory := IRemoteSystemWebAccountFilterFactory(factoryPtr)
        }

        return RemoteSystemWebAccountFilter.__IRemoteSystemWebAccountFilterFactory.Create(account)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The web account that the containing [RemoteSystemStatusTypeFilter](remotesystemstatustypefilter.md) object targets.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwebaccountfilter.account
     * @type {WebAccount} 
     */
    Account {
        get => this.get_Account()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebAccount} 
     */
    get_Account() {
        if (!this.HasProp("__IRemoteSystemWebAccountFilter")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWebAccountFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWebAccountFilter := IRemoteSystemWebAccountFilter(outPtr)
        }

        return this.__IRemoteSystemWebAccountFilter.get_Account()
    }

;@endregion Instance Methods
}
