#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Describes a presentation buffer that has been registered with a presentation manager.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationbuffer
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationBuffer
     * @type {Guid}
     */
    static IID => Guid("{2e217d3a-5abb-4138-9a13-a775593c89ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableEvent", "IsAvailable"]

    /**
     * Gets a handle to an event that signals when the buffer is available.
     * @remarks
     * The caller is responsible for closing the returned event.
     * 
     * An application can wait on and query this event, but it cannot modify its state. The presentation manager controls this event.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the event.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-getavailableevent
     */
    GetAvailableEvent() {
        availableEventHandle := HANDLE()
        result := ComCall(3, this, "ptr", availableEventHandle, "HRESULT")
        return availableEventHandle
    }

    /**
     * Gets a value that indicates whether or not this buffer is available for use by the producer.
     * @returns {Integer} Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the buffer is available; otherwise, `FALSE`.
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-isavailable
     */
    IsAvailable() {
        result := ComCall(4, this, "char*", &isAvailable := 0, "HRESULT")
        return isAvailable
    }
}
