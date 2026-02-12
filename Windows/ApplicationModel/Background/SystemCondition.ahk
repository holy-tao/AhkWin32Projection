#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemCondition.ahk
#Include .\ISystemConditionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a system condition that must be in effect for a background task to run.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemcondition
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class SystemCondition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemCondition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemCondition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of a system condition.
     * @param {Integer} conditionType_ Specifies the condition type.
     * @returns {SystemCondition} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemcondition.#ctor
     */
    static Create(conditionType_) {
        if (!SystemCondition.HasProp("__ISystemConditionFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.SystemCondition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemConditionFactory.IID)
            SystemCondition.__ISystemConditionFactory := ISystemConditionFactory(factoryPtr)
        }

        return SystemCondition.__ISystemConditionFactory.Create(conditionType_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the condition type of a system condition.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.systemcondition.conditiontype
     * @type {Integer} 
     */
    ConditionType {
        get => this.get_ConditionType()
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
    get_ConditionType() {
        if (!this.HasProp("__ISystemCondition")) {
            if ((queryResult := this.QueryInterface(ISystemCondition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemCondition := ISystemCondition(outPtr)
        }

        return this.__ISystemCondition.get_ConditionType()
    }

;@endregion Instance Methods
}
