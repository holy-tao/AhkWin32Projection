#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeferral.ahk
#Include .\IClosable.ahk
#Include .\IDeferralFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Stores a [DeferralCompletedHandler](deferralcompletedhandler.md) to be invoked upon completion of the deferral and manipulates the state of the deferral.
 * @remarks
 * For more information about the **Deferral** class, see the section about deferrals in [App lifecycle](/windows/uwp/launch-resume/app-lifecycle#reentering-the-background-state) and the [ExtendedExecution sample](https://github.com/Microsoft/Windows-universal-samples/blob/master/Samples/ExtendedExecution/cs/Scenario4_MultipleTasks.xaml.cs).
 * 
 * Javascript apps should not allow navigation before completing a [DeferralCompletedHandler](deferralcompletedhandler.md). Doing so could cause an app to crash and should be considered a programming error.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.deferral
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class Deferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeferral.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new [Deferral](deferral.md) object and specifies a [DeferralCompletedHandler](deferralcompletedhandler.md) to be called upon completion of the deferral.
     * @param {DeferralCompletedHandler} handler A [DeferralCompletedHandler](deferralcompletedhandler.md) to be called upon completion of the deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.deferral.#ctor
     */
    static Create(handler) {
        if (!Deferral.HasProp("__IDeferralFactory")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Deferral")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeferralFactory.IID)
            Deferral.__IDeferralFactory := IDeferralFactory(factoryPtr)
        }

        return Deferral.__IDeferralFactory.Create(handler)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * If the [DeferralCompletedHandler](deferralcompletedhandler.md) has not yet been invoked, this will call it and drop the reference to the delegate.
     * @remarks
     * If the [DeferralCompletedHandler](deferralcompletedhandler.md) has not yet been invoked, this will call it and drop the reference to the delegate. Otherwise, it will throw a programming error exception.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.deferral.complete
     */
    Complete() {
        if (!this.HasProp("__IDeferral")) {
            if ((queryResult := this.QueryInterface(IDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeferral := IDeferral(outPtr)
        }

        return this.__IDeferral.Complete()
    }

    /**
     * If the [DeferralCompletedHandler](deferralcompletedhandler.md) has not yet been invoked, this will call it and drop the reference to the delegate.
     * @remarks
     * If the [DeferralCompletedHandler](deferralcompletedhandler.md) has not yet been invoked, this will call it and drop the reference to the delegate. Otherwise, since Close must be safe to call multiple times, this will simply succeed without doing anything.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.deferral.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
