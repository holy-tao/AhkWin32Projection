#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A multithread interface accesses multithread settings and can only be used if the thread-safe layer is turned on.
 * @remarks
 * 
 * This interface is obtained by querying it from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10multithread
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Multithread extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Multithread
     * @type {Guid}
     */
    static IID => Guid("{9b7e4e00-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enter", "Leave", "SetMultithreadProtected", "GetMultithreadProtected"]

    /**
     * Enter a device's critical section.
     * @remarks
     * 
     * Entering a device's critical section prevents other threads from simultaneously calling that device's methods (if <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-setmultithreadprotected">multithread protection</a> is set to true), calling DXGI methods, and calling the methods of all resource, view, shader, state, and asynchronous interfaces.
     * 
     * This function should be used in multithreaded applications when there is a series of graphics commands that must happen in order. This function is typically called at the beginning of the series of graphics commands, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-leave">ID3D10Multithread::Leave</a> is typically called after those graphics commands.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10multithread-enter
     */
    Enter() {
        ComCall(3, this)
    }

    /**
     * Leave a device's critical section.
     * @remarks
     * 
     * This function is typically used in multithreaded applications when there is a series of graphics commands that must happen in order. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10multithread-enter">ID3D10Multithread::Enter</a> is typically called at the beginning of a series of graphics commands, and this function is typically called after those graphics commands.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10multithread-leave
     */
    Leave() {
        ComCall(4, this)
    }

    /**
     * Turn multithreading on or off.
     * @param {BOOL} bMTProtect Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True to turn multithreading on, false to turn it off.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if multithreading was turned on prior to calling this method, false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10multithread-setmultithreadprotected
     */
    SetMultithreadProtected(bMTProtect) {
        result := ComCall(5, this, "int", bMTProtect, "int")
        return result
    }

    /**
     * Find out if multithreading is turned on or not.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Whether or not multithreading is turned on. True means on, false means off.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(6, this, "int")
        return result
    }
}
