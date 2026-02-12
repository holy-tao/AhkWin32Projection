#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentSessionConnectionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionConnectionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentSessionConnectionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentSessionConnectionChangedEventArgs.IID

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
        if (!this.HasProp("__IDeploymentSessionConnectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionConnectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionConnectionChangedEventArgs := IDeploymentSessionConnectionChangedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionConnectionChangedEventArgs.get_SessionId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Change() {
        if (!this.HasProp("__IDeploymentSessionConnectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeploymentSessionConnectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentSessionConnectionChangedEventArgs := IDeploymentSessionConnectionChangedEventArgs(outPtr)
        }

        return this.__IDeploymentSessionConnectionChangedEventArgs.get_Change()
    }

;@endregion Instance Methods
}
