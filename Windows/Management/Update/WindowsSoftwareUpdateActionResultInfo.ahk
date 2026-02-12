#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateActionResultInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateActionResultInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateActionResultInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateActionResultInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {Integer} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionResultInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionResultInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionResultInfo := IWindowsSoftwareUpdateActionResultInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionResultInfo.get_Timestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionResultInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionResultInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionResultInfo := IWindowsSoftwareUpdateActionResultInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionResultInfo.get_Succeeded()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionResultInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionResultInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionResultInfo := IWindowsSoftwareUpdateActionResultInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionResultInfo.get_ResultCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionResultInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionResultInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionResultInfo := IWindowsSoftwareUpdateActionResultInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionResultInfo.get_ExtendedError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionResultInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionResultInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionResultInfo := IWindowsSoftwareUpdateActionResultInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionResultInfo.get_Action()
    }

;@endregion Instance Methods
}
