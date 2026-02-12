#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\SizeInt32.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IDirect3D11CaptureFrame extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D11CaptureFrame
     * @type {Guid}
     */
    static IID => Guid("{fa50c623-38da-4b32-acf3-fa9734ad800e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Surface", "get_SystemRelativeTime", "get_ContentSize"]

    /**
     * @type {IDirect3DSurface} 
     */
    Surface {
        get => this.get_Surface()
    }

    /**
     * @type {TimeSpan} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
    }

    /**
     * @type {SizeInt32} 
     */
    ContentSize {
        get => this.get_ContentSize()
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Surface() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeTime() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_ContentSize() {
        value := SizeInt32()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
