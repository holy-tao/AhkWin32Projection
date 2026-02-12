#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IMusicDisplayProperties3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMusicDisplayProperties3
     * @type {Guid}
     */
    static IID => Guid("{4db51ac1-0681-4e8c-9401-b8159d9eefc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlbumTrackCount", "put_AlbumTrackCount"]

    /**
     * @type {Integer} 
     */
    AlbumTrackCount {
        get => this.get_AlbumTrackCount()
        set => this.put_AlbumTrackCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlbumTrackCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlbumTrackCount(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
