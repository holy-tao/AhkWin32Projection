#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOperationCompletedEventArgs.ahk
#Include .\IOperationCompletedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains info about the action that a target app completed during a paste operation.
 * @remarks
 * An [OperationCompleted](datapackage_operationcompleted.md) event occurs when the user pastes content.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.operationcompletedeventargs
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class OperationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOperationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOperationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the operation that the target app completed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.operationcompletedeventargs.operation
     * @type {Integer} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * Gets the accepted format Id.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.operationcompletedeventargs.acceptedformatid
     * @type {HSTRING} 
     */
    AcceptedFormatId {
        get => this.get_AcceptedFormatId()
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
    get_Operation() {
        if (!this.HasProp("__IOperationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IOperationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOperationCompletedEventArgs := IOperationCompletedEventArgs(outPtr)
        }

        return this.__IOperationCompletedEventArgs.get_Operation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AcceptedFormatId() {
        if (!this.HasProp("__IOperationCompletedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IOperationCompletedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOperationCompletedEventArgs2 := IOperationCompletedEventArgs2(outPtr)
        }

        return this.__IOperationCompletedEventArgs2.get_AcceptedFormatId()
    }

;@endregion Instance Methods
}
