#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LearningModelDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{49f32107-a8bf-42bb-92c7-10b12dc5d21f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromDirect3D11Device"]

    /**
     * 
     * @param {IDirect3DDevice} device 
     * @returns {LearningModelDevice} 
     */
    CreateFromDirect3D11Device(device) {
        result := ComCall(6, this, "ptr", device, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelDevice(result_)
    }
}
