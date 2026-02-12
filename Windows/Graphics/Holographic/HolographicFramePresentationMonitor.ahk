#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFramePresentationMonitor.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Monitors an independent stream of frame presentation reports from a HolographicSpace.
 * @remarks
 * A frame presentation monitor starts queuing frame reports immediately upon creation and continues until Close is called.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationmonitor
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFramePresentationMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFramePresentationMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFramePresentationMonitor.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Returns a list of reports for frame presentations which have occurred since the last time the method was called.
     * @remarks
     * A frame presentation report only becomes available once the compositor presents the frame for the last time and moves on to the next frame.
     * @returns {IVectorView<HolographicFramePresentationReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationmonitor.readreports
     */
    ReadReports() {
        if (!this.HasProp("__IHolographicFramePresentationMonitor")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationMonitor := IHolographicFramePresentationMonitor(outPtr)
        }

        return this.__IHolographicFramePresentationMonitor.ReadReports()
    }

    /**
     * Disposes of this frame presentation monitor, releasing any unread reports.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationmonitor.close
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
