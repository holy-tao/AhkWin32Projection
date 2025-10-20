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
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<UInt32>} dataSize 
     * @param {Pointer} data 
     * @returns {HRESULT} 
     */
    GetPrivateData(guid, dataSize, data) {
        result := ComCall(3, this, "ptr", guid, "uint*", dataSize, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} dataSize 
     * @param {Pointer} data 
     * @returns {HRESULT} 
     */
    SetPrivateData(guid, dataSize, data) {
        result := ComCall(4, this, "ptr", guid, "uint", dataSize, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} data 
     * @returns {HRESULT} 
     */
    SetPrivateDataInterface(guid, data) {
        result := ComCall(5, this, "ptr", guid, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @returns {HRESULT} 
     */
    SetName(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(6, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
