#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeploymentResult.ahk
#Include .\IDeploymentResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the result of a deployment request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentresult
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class DeploymentResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeploymentResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeploymentResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets extended error text for the error if the deployment operation is not successful.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentresult.errortext
     * @type {HSTRING} 
     */
    ErrorText {
        get => this.get_ErrorText()
    }

    /**
     * Gets the activity identifier used to look up an event in Windows Event Viewer. Gets the activity identifier used to look up an event. All events of a deployment operation are logged with the same **activityId**.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentresult.activityid
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * The extended error code can be used to distinguish a specific error condition which needs to be handled differently from the general error indicated by the return code. The extended error code may provide a more specific reason for the failure that caused the general error. Also, it usually corresponds directly to the specific message in the [ErrorText](deploymentresult_errortext.md).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentresult.extendederrorcode
     * @type {HRESULT} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * Describes whether or not the package is fully registered and ready to use.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentresult.isregistered
     * @type {Boolean} 
     */
    IsRegistered {
        get => this.get_IsRegistered()
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
    get_ErrorText() {
        if (!this.HasProp("__IDeploymentResult")) {
            if ((queryResult := this.QueryInterface(IDeploymentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentResult := IDeploymentResult(outPtr)
        }

        return this.__IDeploymentResult.get_ErrorText()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        if (!this.HasProp("__IDeploymentResult")) {
            if ((queryResult := this.QueryInterface(IDeploymentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentResult := IDeploymentResult(outPtr)
        }

        return this.__IDeploymentResult.get_ActivityId()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedErrorCode() {
        if (!this.HasProp("__IDeploymentResult")) {
            if ((queryResult := this.QueryInterface(IDeploymentResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentResult := IDeploymentResult(outPtr)
        }

        return this.__IDeploymentResult.get_ExtendedErrorCode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRegistered() {
        if (!this.HasProp("__IDeploymentResult2")) {
            if ((queryResult := this.QueryInterface(IDeploymentResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeploymentResult2 := IDeploymentResult2(outPtr)
        }

        return this.__IDeploymentResult2.get_IsRegistered()
    }

;@endregion Instance Methods
}
