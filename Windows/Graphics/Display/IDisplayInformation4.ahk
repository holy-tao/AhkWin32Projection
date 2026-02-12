#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayInformation4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayInformation4
     * @type {Guid}
     */
    static IID => Guid("{c972ce2f-1242-46be-b536-e1aafe9e7acf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScreenWidthInRawPixels", "get_ScreenHeightInRawPixels"]

    /**
     * @type {Integer} 
     */
    ScreenWidthInRawPixels {
        get => this.get_ScreenWidthInRawPixels()
    }

    /**
     * @type {Integer} 
     */
    ScreenHeightInRawPixels {
        get => this.get_ScreenHeightInRawPixels()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScreenWidthInRawPixels() {
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
    get_ScreenHeightInRawPixels() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
