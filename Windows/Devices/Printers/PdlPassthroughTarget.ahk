#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPdlPassthroughTarget.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a print job PDL pass-through stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughtarget
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class PdlPassthroughTarget extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPdlPassthroughTarget

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPdlPassthroughTarget.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the print spooler job id for the current print job.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughtarget.printjobid
     * @type {Integer} 
     */
    PrintJobId {
        get => this.get_PrintJobId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrintJobId() {
        if (!this.HasProp("__IPdlPassthroughTarget")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughTarget := IPdlPassthroughTarget(outPtr)
        }

        return this.__IPdlPassthroughTarget.get_PrintJobId()
    }

    /**
     * Retrieves the output stream, which will be passed to the printer.
     * @returns {IOutputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughtarget.getoutputstream
     */
    GetOutputStream() {
        if (!this.HasProp("__IPdlPassthroughTarget")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughTarget := IPdlPassthroughTarget(outPtr)
        }

        return this.__IPdlPassthroughTarget.GetOutputStream()
    }

    /**
     * Indicates that the PDL stream is finished. Call [Close](./pdlpassthroughtarget_close_811482585.md) before calling **Submit**, otherwise the print job will fail.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughtarget.submit
     */
    Submit() {
        if (!this.HasProp("__IPdlPassthroughTarget")) {
            if ((queryResult := this.QueryInterface(IPdlPassthroughTarget.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPdlPassthroughTarget := IPdlPassthroughTarget(outPtr)
        }

        return this.__IPdlPassthroughTarget.Submit()
    }

    /**
     * Closes the stream. Call **Close** before calling [Submit](./pdlpassthroughtarget_submit_1187062204.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.pdlpassthroughtarget.close
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
