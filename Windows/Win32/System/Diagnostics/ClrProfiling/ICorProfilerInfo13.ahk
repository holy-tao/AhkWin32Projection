#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerInfo12.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerInfo13 extends ICorProfilerInfo12{
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
     * 
     * @param {Pointer} object 
     * @param {Integer} type 
     * @param {Pointer<Void>} pHandle 
     * @returns {HRESULT} 
     */
    CreateHandle(object, type, pHandle) {
        result := ComCall(108, this, "ptr", object, "int", type, "ptr", pHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} handle 
     * @returns {HRESULT} 
     */
    DestroyHandle(handle) {
        result := ComCall(109, this, "ptr", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} handle 
     * @param {Pointer<UIntPtr>} pObject 
     * @returns {HRESULT} 
     */
    GetObjectIDFromHandle(handle, pObject) {
        result := ComCall(110, this, "ptr", handle, "ptr*", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
