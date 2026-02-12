#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateApprovalInfo.ahk
#Include .\IWindowsSoftwareUpdateApprovalInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateApprovalInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateApprovalInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateApprovalInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Boolean} userInitiated 
     * @param {Boolean} appClosure 
     * @param {Boolean} meteredNetwork 
     * @param {Boolean} seeker 
     * @returns {WindowsSoftwareUpdateApprovalInfo} 
     */
    static CreateInstance(userInitiated, appClosure, meteredNetwork, seeker) {
        if (!WindowsSoftwareUpdateApprovalInfo.HasProp("__IWindowsSoftwareUpdateApprovalInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateApprovalInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateApprovalInfoFactory.IID)
            WindowsSoftwareUpdateApprovalInfo.__IWindowsSoftwareUpdateApprovalInfoFactory := IWindowsSoftwareUpdateApprovalInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateApprovalInfo.__IWindowsSoftwareUpdateApprovalInfoFactory.CreateInstance(userInitiated, appClosure, meteredNetwork, seeker)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    UserInitiated {
        get => this.get_UserInitiated()
    }

    /**
     * @type {Boolean} 
     */
    AppClosure {
        get => this.get_AppClosure()
    }

    /**
     * @type {Boolean} 
     */
    MeteredNetwork {
        get => this.get_MeteredNetwork()
    }

    /**
     * @type {Boolean} 
     */
    Seeker {
        get => this.get_Seeker()
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
    get_UserInitiated() {
        if (!this.HasProp("__IWindowsSoftwareUpdateApprovalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateApprovalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateApprovalInfo := IWindowsSoftwareUpdateApprovalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateApprovalInfo.get_UserInitiated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AppClosure() {
        if (!this.HasProp("__IWindowsSoftwareUpdateApprovalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateApprovalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateApprovalInfo := IWindowsSoftwareUpdateApprovalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateApprovalInfo.get_AppClosure()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MeteredNetwork() {
        if (!this.HasProp("__IWindowsSoftwareUpdateApprovalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateApprovalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateApprovalInfo := IWindowsSoftwareUpdateApprovalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateApprovalInfo.get_MeteredNetwork()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Seeker() {
        if (!this.HasProp("__IWindowsSoftwareUpdateApprovalInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateApprovalInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateApprovalInfo := IWindowsSoftwareUpdateApprovalInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateApprovalInfo.get_Seeker()
    }

;@endregion Instance Methods
}
