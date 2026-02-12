#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionGraphicsDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IRenderingDeviceReplacedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRenderingDeviceReplacedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3a31ac7d-28bf-4e7a-8524-71679d480f38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GraphicsDevice"]

    /**
     * @type {CompositionGraphicsDevice} 
     */
    GraphicsDevice {
        get => this.get_GraphicsDevice()
    }

    /**
     * 
     * @returns {CompositionGraphicsDevice} 
     */
    get_GraphicsDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionGraphicsDevice(value)
    }
}
