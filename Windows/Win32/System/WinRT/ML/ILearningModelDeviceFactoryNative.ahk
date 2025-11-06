#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ILearningModelDeviceFactoryNative extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromD3D12CommandQueue"]

    /**
     * 
     * @param {ID3D12CommandQueue} value 
     * @returns {IUnknown} 
     */
    CreateFromD3D12CommandQueue(value) {
        result := ComCall(3, this, "ptr", value, "ptr*", &result := 0, "HRESULT")
        return IUnknown(result)
    }
}
