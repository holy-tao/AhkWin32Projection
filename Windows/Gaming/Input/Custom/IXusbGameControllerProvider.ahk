#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IXusbGameControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXusbGameControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{6e2971eb-0efb-48b4-808b-837643b2f216}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVibration"]

    /**
     * 
     * @param {Float} lowFrequencyMotorSpeed 
     * @param {Float} highFrequencyMotorSpeed 
     * @returns {HRESULT} 
     */
    SetVibration(lowFrequencyMotorSpeed, highFrequencyMotorSpeed) {
        result := ComCall(6, this, "double", lowFrequencyMotorSpeed, "double", highFrequencyMotorSpeed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
