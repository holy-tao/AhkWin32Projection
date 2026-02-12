#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IVideoEncodingProperties4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEncodingProperties4
     * @type {Guid}
     */
    static IID => Guid("{724ef014-c10c-40f2-9d72-3ee13b45fa8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SphericalVideoFrameFormat"]

    /**
     * @type {Integer} 
     */
    SphericalVideoFrameFormat {
        get => this.get_SphericalVideoFrameFormat()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SphericalVideoFrameFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
