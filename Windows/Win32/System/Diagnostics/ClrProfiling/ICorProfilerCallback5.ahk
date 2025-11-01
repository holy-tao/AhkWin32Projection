#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICorProfilerCallback4.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerCallback5 extends ICorProfilerCallback4{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConditionalWeakTableElementReferences"]

    /**
     * 
     * @param {Integer} cRootRefs 
     * @param {Pointer<Pointer>} keyRefIds 
     * @param {Pointer<Pointer>} valueRefIds 
     * @param {Pointer<Pointer>} rootIds 
     * @returns {HRESULT} 
     */
    ConditionalWeakTableElementReferences(cRootRefs, keyRefIds, valueRefIds, rootIds) {
        keyRefIdsMarshal := keyRefIds is VarRef ? "ptr*" : "ptr"
        valueRefIdsMarshal := valueRefIds is VarRef ? "ptr*" : "ptr"
        rootIdsMarshal := rootIds is VarRef ? "ptr*" : "ptr"

        result := ComCall(89, this, "uint", cRootRefs, keyRefIdsMarshal, keyRefIds, valueRefIdsMarshal, valueRefIds, rootIdsMarshal, rootIds, "HRESULT")
        return result
    }
}
