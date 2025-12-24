#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides threading protection for critical sections of a multi-threaded application.
 * @remarks
 * 
 * This interface is obtained by querying it from an immediate device context created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> (or later versions of this) interface 
 *           using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
 * 
 * Unlike D3D10, there is no multithreaded layer in D3D11. By default, multithread protection is turned off. Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected">SetMultithreadProtected</a> to turn it on, then <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-enter">Enter</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-leave">Leave</a> to encapsulate graphics commands that  must be executed in a specific order.
 * 
 * By default in D3D11, applications can only use one thread with the immediate context at a time. But, applications can use this interface to change that restriction. The interface can turn on threading protection for the immediate context, which will increase the overhead of each immediate context call in order to share one context with multiple threads.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11multithread
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11Multithread extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11Multithread
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
     * If <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected">SetMultithreadProtected</a> is set to true, then entering a device's critical section prevents other threads from simultaneously calling that device's methods, calling DXGI methods, and calling the methods of all resource, view, shader, state, and asynchronous interfaces.
     * 
     * This function should be used in multithreaded applications when there is a series of graphics commands that must happen in order. This function is typically called at the beginning of the series of graphics commands, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-leave">Leave</a> is typically called after those graphics commands.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11multithread-enter
     */
    Enter() {
        ComCall(3, this)
    }

    /**
     * Leave a device's critical section.
     * @remarks
     * 
     * This function is typically used in multithreaded applications when there is a series of graphics commands 
     * 		  that must happen in order. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_4/nf-d3d11_4-id3d11multithread-enter">Enter</a> is typically called at the beginning of a series of graphics commands, and this function is typically 
     * 		  called after those graphics commands.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11multithread-leave
     */
    Leave() {
        ComCall(4, this)
    }

    /**
     * Turns multithread protection on or off.
     * @param {BOOL} bMTProtect Type: <b>BOOL</b>
     * 
     * Set to true to turn multithread protection on, false to turn it off.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * True if multithread protection was already turned on prior to calling this method, false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11multithread-setmultithreadprotected
     */
    SetMultithreadProtected(bMTProtect) {
        result := ComCall(5, this, "int", bMTProtect, "int")
        return result
    }

    /**
     * Find out if multithread protection is turned on or not.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns true if multithread protection is turned on, false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nf-d3d11_4-id3d11multithread-getmultithreadprotected
     */
    GetMultithreadProtected() {
        result := ComCall(6, this, "int")
        return result
    }
}
