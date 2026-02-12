#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DdLock callback function locks a specified area of surface memory and provides a valid pointer to a block of memory associated with a surface.
 * @remarks
 * <i>DdLock</i> 
 * 	 should set the <b>ddRVal</b> member 
 * 	 of the DD_LOCKDATA structure at <i>lpLock</i> to 
 * 	 DDERR_WASSTILLDRAWING and return DDHAL_DRIVER_HANDLED 
 * 	 if a blit or flip is in progress.
 * 
 * Unless otherwise specified by the 
 * 	 <b>dwFlags</b> member of 
 * 	 DD_LOCKDATA, the driver can return a memory pointer to 
 * 	 the top of the surface in the 
 * 	 <b>lpSurfData</b> member of 
 * 	 DD_LOCKDATA. If the driver needs to calculate its own 
 * 	 address for the surface, it can rely on the pointer 
 * 	 passed in the <b>fpProcess</b> 
 * 	 member of DD_LOCKDATA as being a per-process pointer to 
 * 	 the user-mode mapping of its DirectDraw-accessible frame 
 * 	 buffer.
 * 
 * A lock does not provide exclusive access to the 
 * 	 requested memory block; that is, multiple threads can 
 * 	 lock the same surface at the same time. It is the 
 * 	 application's responsibility to synchronize access to 
 * 	 the memory block whose pointer is being obtained.
 * 
 * A driver running on an NT-based operating system 
 * 	 should not return a pointer to system memory from 
 * 	 its <i>DdLock</i> 
 * 	 function unless that driver's 
 * 	 <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> 
 * 	 function previously allocated such memory with the 
 * 	 PLEASE_ALLOC_USERMEM flag. If PLEASE_ALLOC_USERMEM was 
 * 	 not used, applications could receive errors whenever they 
 * 	 attempted to access such memory. See 
 * 	 <a href="https://docs.microsoft.com/">NT Kernel's Implementation 
 * 	 of DDLOCK_NOSYSLOCK</a> for more information.
 * 
 * <i>DdLock</i> can be called with a disabled 
 * 	 <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A PDEV is disabled 
 * 	 or enabled by calling the display driver's 
 * 	 <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> 
 * 	 function. See 
 * 	 <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> 
 * 	 for more information.
 * 
 * <h3><a id="display.ddlock.NT_Kernels_Implementation_of_DDLOCK_NOSYSLOCK"></a><a id="display.ddlock.nt_kernels_implementation_of_ddlock_nosyslock"></a><a id="DISPLAY.DDLOCK.NT_KERNELS_IMPLEMENTATION_OF_DDLOCK_NOSYSLOCK"></a>NT Kernel's Implementation of DDLOCK_NOSYSLOCK</h3>
 * Applications can use DirectDraw's and Direct3D's application programming interfaces (APIs) to obtain long-duration locks on video memory resources. Such locks are called "NOSYSLOCK" locks. These locks operate differently than typical video-memory locks as described in the following paragraphs. 
 * 
 * After the DirectDraw runtime calls a driver's <i>DdLock</i> function with the DDLOCK_NOSYSLOCK flag specified in the <b>dwFlags</b> member of DD_LOCKDATA, the runtime examines the pointer to the surface contents returned by the driver. Instead of passing the driver-returned pointer directly to an application, the runtime creates a second user-mode mapping of video memory (both local and nonlocal) and calculates the equivalent virtual address within that mapping. This virtual address is known as the alias pointer to the memory lock. The runtime passes this alias-lock pointer to the application. The application uses this alias-lock pointer to read and write directly to video memory. Neither the application nor the driver is aware that it uses a different locked-memory pointer. 
 * 
 * Later, at mode-switch time, the DirectDraw runtime notes any outstanding alias-lock pointers. Instead of waiting for the alias-lock pointers to complete--as it would for a typical video-memory lock--the runtime remaps the user-mode mapping of video memory and allows the mode switch to continue. The runtime remaps the user-mode mappings to a single dummy page; the application continues to read and write to that dummy page, otherwise unaware of any changes. The runtime must then clean up alias-lock pointers by calling the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> function. The runtime can clean up alias-lock pointers because the application is no longer writing into video memory. Because this clean up occurs at mode-switch time, the next step in the sequence is to lose surfaces, which means to destroy the driver's per-surface objects. In other words, the runtime calls the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface">DdDestroySurface</a> function for all surfaces, including surfaces that the application continues to consider as locked. In fact, the application continues to read and write to a dummy page of system memory.
 * 
 * This whole process only works if the memory pointer returned by <i>DdLock</i> is some mapping of video memory. This video-memory mapping can be either the user-mode mapping of nonlocal video memory performed by the DirectDraw kernel-mode runtime or the mapping provided by the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a> function. If the memory pointer cannot be attributed to one of these mappings, the runtime does not remap the lock. The mode switch continues, which means that the driver's surface object is unlocked and destroyed through calls to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface">DdDestroySurface</a> functions respectively. The driver then typically releases any system memory that the driver allocated at lock time. Because the application is still writing to this memory, an access violation occurs. 
 * 
 * Consequently, a driver should not attempt to return system memory pointers from its <i>DdLock</i> function unless that driver's <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549263(v=vs.85)">DdCreateSurface</a> function previously allocated such memory with the PLEASE_ALLOC_USERMEM flag. The DirectDraw runtime owns memory allocated in this manner and can defer release of this memory until the application unlocks the memory. Therefore, the driver's <i>DdLock</i> function can return pointers to memory allocated in this manner without risk of crashing the application.
 * @see https://learn.microsoft.com/windows/win32/api//content/ddrawint/nc-ddrawint-pdd_surfcb_lock
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class PDD_SURFCB_LOCK extends IUnknown {

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
     * @param {Pointer<DD_LOCKDATA>} param0 
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
