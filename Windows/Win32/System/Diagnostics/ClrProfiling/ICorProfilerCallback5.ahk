#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback5 extends ICorProfilerCallback4{
    /**
     * The interface identifier for ICorProfilerCallback5
     * @type {Guid}
     */
    static IID => Guid("{8dfba405-8c9f-45f8-bffa-83b14cef78b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 89

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<UIntPtr>} keyRefIds 
     * @param {Pointer<UIntPtr>} valueRefIds 
     * @param {Pointer<UIntPtr>} rootIds 
     * @returns {HRESULT} 
     */
    ConditionalWeakTableElementReferences(cRootRefs, keyRefIds, valueRefIds, rootIds) {
        result := ComCall(89, this, "uint", cRootRefs, "ptr*", keyRefIds, "ptr*", valueRefIds, "ptr*", rootIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
