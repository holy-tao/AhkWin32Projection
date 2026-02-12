#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDiagnosticInvoker.ahk
#Include .\IDiagnosticInvoker2.ahk
#Include .\IDiagnosticInvokerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains functionality for executing a diagnostics troubleshooting package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class DiagnosticInvoker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDiagnosticInvoker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDiagnosticInvoker.IID

    /**
     * Gets a Boolean value indicating if the diagnostics invoker is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => DiagnosticInvoker.get_IsSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default diagnostics invoker.
     * @returns {DiagnosticInvoker} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker.getdefault
     */
    static GetDefault() {
        if (!DiagnosticInvoker.HasProp("__IDiagnosticInvokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.DiagnosticInvoker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDiagnosticInvokerStatics.IID)
            DiagnosticInvoker.__IDiagnosticInvokerStatics := IDiagnosticInvokerStatics(factoryPtr)
        }

        return DiagnosticInvoker.__IDiagnosticInvokerStatics.GetDefault()
    }

    /**
     * Gets the diagnostics invoker for the specified user.
     * @remarks
     * This method will always throw **E_NOTIMPL**, the not implemented exception, by design. The GetForUser method is part of the **IDiagnosticInvoker** interface definition.
     * @param {User} user_ The user for which to get the diagnostics invoker.
     * @returns {DiagnosticInvoker} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker.getforuser
     */
    static GetForUser(user_) {
        if (!DiagnosticInvoker.HasProp("__IDiagnosticInvokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.DiagnosticInvoker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDiagnosticInvokerStatics.IID)
            DiagnosticInvoker.__IDiagnosticInvokerStatics := IDiagnosticInvokerStatics(factoryPtr)
        }

        return DiagnosticInvoker.__IDiagnosticInvokerStatics.GetForUser(user_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!DiagnosticInvoker.HasProp("__IDiagnosticInvokerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.DiagnosticInvoker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDiagnosticInvokerStatics.IID)
            DiagnosticInvoker.__IDiagnosticInvokerStatics := IDiagnosticInvokerStatics(factoryPtr)
        }

        return DiagnosticInvoker.__IDiagnosticInvokerStatics.get_IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously runs the diagnostics invoker with the specified diagnostics context.
     * @param {JsonObject} context_ A Json object containing the context for the diagnostics action.
     * @returns {IAsyncOperationWithProgress<DiagnosticActionResult, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker.rundiagnosticactionasync
     */
    RunDiagnosticActionAsync(context_) {
        if (!this.HasProp("__IDiagnosticInvoker")) {
            if ((queryResult := this.QueryInterface(IDiagnosticInvoker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticInvoker := IDiagnosticInvoker(outPtr)
        }

        return this.__IDiagnosticInvoker.RunDiagnosticActionAsync(context_)
    }

    /**
     * Asynchronously runs the diagnostics invoker with the specified diagnostics context.
     * @remarks
     * Converts the _context_ string to a JsonObject, then passes it in a call to [RunDiagnosticActionAsync](diagnosticinvoker_rundiagnosticactionasync_1910164149.md).
     * @param {HSTRING} context_ A string containing the context for the diagnostics action.
     * @returns {IAsyncOperationWithProgress<DiagnosticActionResult, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticinvoker.rundiagnosticactionfromstringasync
     */
    RunDiagnosticActionFromStringAsync(context_) {
        if (!this.HasProp("__IDiagnosticInvoker2")) {
            if ((queryResult := this.QueryInterface(IDiagnosticInvoker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDiagnosticInvoker2 := IDiagnosticInvoker2(outPtr)
        }

        return this.__IDiagnosticInvoker2.RunDiagnosticActionFromStringAsync(context_)
    }

;@endregion Instance Methods
}
