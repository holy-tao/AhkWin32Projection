#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\DisplayAdapterId.ahk
#Include ..\..\Graphics\DirectX\Direct3D11\IDirect3DDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelDevice
     * @type {Guid}
     */
    static IID => Guid("{f5c2c8fe-3f56-4a8c-ac5f-fdb92d8b8252}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdapterId", "get_Direct3D11Device"]

    /**
     * @type {DisplayAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * @type {IDirect3DDevice} 
     */
    Direct3D11Device {
        get => this.get_Direct3D11Device()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_AdapterId() {
        value := DisplayAdapterId()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IDirect3DDevice} 
     */
    get_Direct3D11Device() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DDevice(value)
    }
}
