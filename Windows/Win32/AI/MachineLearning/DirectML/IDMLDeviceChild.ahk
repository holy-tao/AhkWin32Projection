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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmldevicechild-getdevice
     */
    GetDevice(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
