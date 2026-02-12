#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentImage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentImage
     * @type {Guid}
     */
    static IID => Guid("{a7a585d9-779f-4b1e-bbb1-8eaf53fbeab2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Height", "get_Width"]

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Height() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
