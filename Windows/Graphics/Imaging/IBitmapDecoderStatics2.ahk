#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class IBitmapDecoderStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitmapDecoderStatics2
     * @type {Guid}
     */
    static IID => Guid("{50ba68ea-99a1-40c4-80d9-aef0dafa6c3f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HeifDecoderId", "get_WebpDecoderId"]

    /**
     * @type {Guid} 
     */
    HeifDecoderId {
        get => this.get_HeifDecoderId()
    }

    /**
     * @type {Guid} 
     */
    WebpDecoderId {
        get => this.get_WebpDecoderId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HeifDecoderId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_WebpDecoderId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
