#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDMLObject.ahk

/**
 * An interface implemented by all objects created from the DirectML device.
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmldevicechild
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLDeviceChild extends IDMLObject{
    /**
     * The interface identifier for IDMLDeviceChild
     * @type {Guid}
     */
    static IID => Guid("{27e83142-8165-49e3-974e-2fd66e4cb69d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetDevice(riid, ppv) {
        result := ComCall(7, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
