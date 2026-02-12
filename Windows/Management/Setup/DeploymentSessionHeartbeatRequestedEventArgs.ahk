#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentSessionHeartbeatRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionHeartbeatRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentSessionHeartbeatRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentSessionHeartbeatRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IDeploymentSessionHeartbeatRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionHeartbeatRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionHeartbeatRequestedEventArgs := IDeploymentSessionHeartbeatRequestedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionHeartbeatRequestedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDeploymentSessionHeartbeatRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionHeartbeatRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionHeartbeatRequestedEventArgs := IDeploymentSessionHeartbeatRequestedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionHeartbeatRequestedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
