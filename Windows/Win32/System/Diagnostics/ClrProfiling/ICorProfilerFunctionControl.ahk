#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class ICorProfilerFunctionControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorProfilerFunctionControl
     * @type {Guid}
     */
    static IID => Guid("{f0963021-e1ea-4732-8581-e01b0bd3c0c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCodegenFlags", "SetILFunctionBody", "SetILInstrumentedCodeMap"]

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    SetCodegenFlags(flags) {
        result := ComCall(3, this, "uint", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbNewILMethodHeader 
     * @param {Pointer<Integer>} pbNewILMethodHeader 
     * @returns {HRESULT} 
     */
    SetILFunctionBody(cbNewILMethodHeader, pbNewILMethodHeader) {
        pbNewILMethodHeaderMarshal := pbNewILMethodHeader is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", cbNewILMethodHeader, pbNewILMethodHeaderMarshal, pbNewILMethodHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cILMapEntries 
     * @param {Pointer<COR_IL_MAP>} rgILMapEntries 
     * @returns {HRESULT} 
     */
    SetILInstrumentedCodeMap(cILMapEntries, rgILMapEntries) {
        result := ComCall(5, this, "uint", cILMapEntries, "ptr", rgILMapEntries, "HRESULT")
        return result
    }
}
