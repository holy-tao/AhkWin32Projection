#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentSessionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentSessionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentSessionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {Integer} 
     */
    Change {
        get => this.get_Change()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        if (!this.HasProp("__IDeploymentSessionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionStateChangedEventArgs := IDeploymentSessionStateChangedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionStateChangedEventArgs.get_SessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Change() {
        if (!this.HasProp("__IDeploymentSessionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionStateChangedEventArgs := IDeploymentSessionStateChangedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionStateChangedEventArgs.get_Change()
    }

;@endregion Instance Methods
}
