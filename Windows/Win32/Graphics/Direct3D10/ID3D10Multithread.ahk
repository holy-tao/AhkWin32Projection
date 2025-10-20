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
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Enter() {
        ComCall(3, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Leave() {
        ComCall(4, this)
        return result
    }

    /**
     * 
     * @param {BOOL} bMTProtect 
     * @returns {BOOL} 
     */
    SetMultithreadProtected(bMTProtect) {
        result := ComCall(5, this, "int", bMTProtect, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetMultithreadProtected() {
        result := ComCall(6, this, "int")
        return result
    }
}
