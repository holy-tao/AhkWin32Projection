#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} SourceContext 
     * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} TargetContext 
     * @param {Integer} RelativeOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(SourceContext, TargetContext, RelativeOffset) {
        ComCall(3, this, "ptr", SourceContext, "ptr", TargetContext, "int64", RelativeOffset)
    }
}
