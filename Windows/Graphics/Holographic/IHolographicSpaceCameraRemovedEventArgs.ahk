#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicCamera.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicSpaceCameraRemovedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpaceCameraRemovedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{805444a8-f2ae-322e-8da9-836a0a95a4c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Camera"]

    /**
     * @type {HolographicCamera} 
     */
    Camera {
        get => this.get_Camera()
    }

    /**
     * 
     * @returns {HolographicCamera} 
     */
    get_Camera() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicCamera(value)
    }
}
