#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateActionInfo.ahk
#Include .\IWindowsSoftwareUpdateActionInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateActionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateActionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateActionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} fileName 
     * @param {HSTRING} fileArguments 
     * @param {Integer} actionType 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    static CreateInstance(fileName, fileArguments, actionType) {
        if (!WindowsSoftwareUpdateActionInfo.HasProp("__IWindowsSoftwareUpdateActionInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateActionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateActionInfoFactory.IID)
            WindowsSoftwareUpdateActionInfo.__IWindowsSoftwareUpdateActionInfoFactory := IWindowsSoftwareUpdateActionInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateActionInfo.__IWindowsSoftwareUpdateActionInfoFactory.CreateInstance(fileName, fileArguments, actionType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    FileName {
        get => this.get_FileName()
    }

    /**
     * @type {HSTRING} 
     */
    FileArguments {
        get => this.get_FileArguments()
    }

    /**
     * @type {Integer} 
     */
    ActionType {
        get => this.get_ActionType()
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
    get_FileName() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionInfo := IWindowsSoftwareUpdateActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionInfo.get_FileName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileArguments() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionInfo := IWindowsSoftwareUpdateActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionInfo.get_FileArguments()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActionType() {
        if (!this.HasProp("__IWindowsSoftwareUpdateActionInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateActionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateActionInfo := IWindowsSoftwareUpdateActionInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateActionInfo.get_ActionType()
    }

;@endregion Instance Methods
}
