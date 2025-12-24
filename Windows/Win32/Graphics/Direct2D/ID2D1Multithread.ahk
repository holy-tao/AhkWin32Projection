#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A locking mechanism from a Direct2D factory that Direct2D uses to control exclusive resource access in an app that is uses multiple threads.
 * @remarks
 * 
 * You can get an <b>ID2D1Multithread</b> object by querying for it from an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> 
 *         object.
 *       
 * 
 * You should use this lock while doing any operation on a Direct3D/DXGI surface. <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> will wait on any call until you 
 *         leave the critical section.
 *       
 * 
 * <div class="alert"><b>Note</b>  Normal rendering is guarded automatically by an internal <a href="https://docs.microsoft.com/windows/desktop/Direct2D/direct2d-portal">Direct2D</a> lock.
 *         </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1multithread
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Multithread extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Multithread
     * @type {Guid}
     */
    static IID => Guid("{31e6e7bc-e0ff-4d46-8c64-a0a8c41c15d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMultithreadProtected", "Enter", "Leave"]

    /**
     * Returns whether the Direct2D factory was created with the D2D1_FACTORY_TYPE_MULTI_THREADED flag.
     * @returns {BOOL} Returns true if the Direct2D factory was created as multi-threaded, or false if it was created as single-threaded.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * Enters the Direct2D API critical section, if it exists.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1multithread-enter
     */
    Enter() {
        ComCall(4, this)
    }

    /**
     * Leaves the Direct2D API critical section, if it exists.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1multithread-leave
     */
    Leave() {
        ComCall(5, this)
    }
}
