#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo12.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo13 extends ICorProfilerInfo12{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerInfo13
     * @type {Guid}
     */
    static IID => Guid("{6e6c7ee2-0701-4ec2-9d29-2e8733b66934}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 108

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateHandle", "DestroyHandle", "GetObjectIDFromHandle"]

    /**
     * 
     * @param {Pointer} object 
     * @param {Integer} type 
     * @returns {Pointer<Pointer<Void>>} 
     */
    CreateHandle(object, type) {
        result := ComCall(108, this, "ptr", object, "int", type, "ptr*", &pHandle := 0, "HRESULT")
        return pHandle
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} handle 
     * @returns {HRESULT} 
     */
    DestroyHandle(handle) {
        handleMarshal := handle is VarRef ? "ptr*" : "ptr"

        result := ComCall(109, this, handleMarshal, handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} handle 
     * @returns {Pointer} 
     */
    GetObjectIDFromHandle(handle) {
        handleMarshal := handle is VarRef ? "ptr*" : "ptr"

        result := ComCall(110, this, handleMarshal, handle, "ptr*", &pObject := 0, "HRESULT")
        return pObject
    }
}
