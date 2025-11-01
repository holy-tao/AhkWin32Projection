#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An interface from which IDMLDevice and IDMLDeviceChild inherit directly (and all other interfaces, indirectly).
 * @see https://docs.microsoft.com/windows/win32/api//directml/nn-directml-idmlobject
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class IDMLObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMLObject
     * @type {Guid}
     */
    static IID => Guid("{c8263aac-9e0c-4a2d-9b8e-007521a3317c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrivateData", "SetPrivateData", "SetPrivateDataInterface", "SetName"]

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} dataSize 
     * @param {Pointer} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-getprivatedata
     */
    GetPrivateData(guid, dataSize, data) {
        result := ComCall(3, this, "ptr", guid, "uint*", dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} dataSize 
     * @param {Pointer} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setprivatedata
     */
    SetPrivateData(guid, dataSize, data) {
        result := ComCall(4, this, "ptr", guid, "uint", dataSize, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, data) {
        result := ComCall(5, this, "ptr", guid, "ptr", data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directml/nf-directml-idmlobject-setname
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(6, this, "ptr", name, "HRESULT")
        return result
    }
}
