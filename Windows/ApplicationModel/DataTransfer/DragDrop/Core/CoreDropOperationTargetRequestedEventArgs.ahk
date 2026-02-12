#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreDropOperationTargetRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the ability to set the target of a drag and drop operation when a target is requested.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredropoperationtargetrequestedeventargs
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop.Core
 * @version WindowsRuntime 1.4
 */
class CoreDropOperationTargetRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreDropOperationTargetRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreDropOperationTargetRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the target of the drag and drop operation.
     * @param {ICoreDropOperationTarget} target The target of the drag and drop operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.core.coredropoperationtargetrequestedeventargs.settarget
     */
    SetTarget(target) {
        if (!this.HasProp("__ICoreDropOperationTargetRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreDropOperationTargetRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreDropOperationTargetRequestedEventArgs := ICoreDropOperationTargetRequestedEventArgs(outPtr)
        }

        return this.__ICoreDropOperationTargetRequestedEventArgs.SetTarget(target)
    }

;@endregion Instance Methods
}
