#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdateValidationLogMessage.ahk
#Include .\IUpdateValidationLogMessageFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdateValidationLogMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdateValidationLogMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdateValidationLogMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} severity 
     * @param {HSTRING} message 
     * @returns {UpdateValidationLogMessage} 
     */
    static CreateInstance(severity, message) {
        if (!UpdateValidationLogMessage.HasProp("__IUpdateValidationLogMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdateValidationLogMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdateValidationLogMessageFactory.IID)
            UpdateValidationLogMessage.__IUpdateValidationLogMessageFactory := IUpdateValidationLogMessageFactory(factoryPtr)
        }

        return UpdateValidationLogMessage.__IUpdateValidationLogMessageFactory.CreateInstance(severity, message)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Severity {
        get => this.get_Severity()
    }

    /**
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
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
    get_Severity() {
        if (!this.HasProp("__IUpdateValidationLogMessage")) {
            if ((queryResult := this.QueryInterface(IUpdateValidationLogMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateValidationLogMessage := IUpdateValidationLogMessage(outPtr)
        }

        return this.__IUpdateValidationLogMessage.get_Severity()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IUpdateValidationLogMessage")) {
            if ((queryResult := this.QueryInterface(IUpdateValidationLogMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdateValidationLogMessage := IUpdateValidationLogMessage(outPtr)
        }

        return this.__IUpdateValidationLogMessage.get_Message()
    }

;@endregion Instance Methods
}
