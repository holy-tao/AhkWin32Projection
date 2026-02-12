#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **WNDOBJCHANGEPROC** function is a driver-defined callback function that GDI uses to notify the driver of changes to the window in question.
 * @remarks
 * The *pfn* parameter of the [EngCreateWnd](/windows/win32/api/winddi/nf-winddi-engcreatewnd) function points to this function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winddi/nc-winddi-wndobjchangeproc
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class WNDOBJCHANGEPROC extends IUnknown {

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
     * @param {Pointer<WNDOBJ>} pwo 
     * @param {Integer} fl 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pwo, fl) {
        ComCall(3, this, "ptr", pwo, "uint", fl)
    }
}
