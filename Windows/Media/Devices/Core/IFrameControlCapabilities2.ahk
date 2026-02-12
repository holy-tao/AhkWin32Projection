#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\FrameFlashCapabilities.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IFrameControlCapabilities2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameControlCapabilities2
     * @type {Guid}
     */
    static IID => Guid("{ce9b0464-4730-440f-bd3e-efe8a8f230a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flash"]

    /**
     * @type {FrameFlashCapabilities} 
     */
    Flash {
        get => this.get_Flash()
    }

    /**
     * 
     * @returns {FrameFlashCapabilities} 
     */
    get_Flash() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FrameFlashCapabilities(value)
    }
}
