#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelDeviceFactoryNative extends IUnknown{
    /**
     * The interface identifier for ILearningModelDeviceFactoryNative
     * @type {Guid}
     */
    static IID => Guid("{1e9b31a1-662e-4ae0-af67-f63bb337e634}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12CommandQueue>} value 
     * @param {Pointer<IUnknown>} result 
     * @returns {HRESULT} 
     */
    CreateFromD3D12CommandQueue(value, result) {
        result := ComCall(3, this, "ptr", value, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
