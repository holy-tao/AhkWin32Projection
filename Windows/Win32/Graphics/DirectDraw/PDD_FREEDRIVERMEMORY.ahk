#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdFreeDriverMemory callback function frees offscreen or nonlocal display memory to satisfy a new allocation request.
 * @remarks
 * The driver should implement <b>DdFreeDriverMemory</b> when it has DirectDraw manage all offscreen display memory management, including allocations for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcreatedevicebitmap">DrvCreateDeviceBitmap</a>. DirectDraw requests for allocations in offscreen memory should always take precedence over GDI device bitmap allocations.
 * 
 * DirectDraw calls <b>DdFreeDriverMemory</b> when it does not have enough offscreen or nonlocal display memory to allocate a surface requested by an application. The driver should move a GDI device bitmap from offscreen memory into system memory and then immediately return. Bitmap moves can be accomplished by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engmodifysurface">EngModifySurface</a>.
 * 
 * DirectDraw will continually call <b>DdFreeDriverMemory</b> until there is enough offscreen memory from which to allocate the requested surface or until the driver returns DDERR_OUTOFMEMORY.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_freedrivermemory
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_FREEDRIVERMEMORY extends IUnknown {

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
     * @param {Pointer<DD_FREEDRIVERMEMORYDATA>} param0 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0) {
        result := ComCall(3, this, "ptr", param0, "uint")
        return result
    }
}
