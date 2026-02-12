#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Graphics\DisplayAdapterId.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayDeviceRenderAdapter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayDeviceRenderAdapter
     * @type {Guid}
     */
    static IID => Guid("{41c86ce5-b18f-573f-9d59-70463115e4cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RenderAdapterId"]

    /**
     * @type {DisplayAdapterId} 
     */
    RenderAdapterId {
        get => this.get_RenderAdapterId()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_RenderAdapterId() {
        value := DisplayAdapterId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
