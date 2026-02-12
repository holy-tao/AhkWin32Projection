#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class pD3DCompile extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} pSrcData 
     * @param {Pointer} SrcDataSize 
     * @param {PSTR} pFileName 
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines 
     * @param {ID3DInclude} pInclude 
     * @param {PSTR} pEntrypoint 
     * @param {PSTR} pTarget 
     * @param {Integer} Flags1 
     * @param {Integer} Flags2 
     * @param {Pointer<ID3DBlob>} ppCode 
     * @param {Pointer<ID3DBlob>} ppErrorMsgs 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, pEntrypoint, pTarget, Flags1, Flags2, ppCode, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName
        pEntrypoint := pEntrypoint is String ? StrPtr(pEntrypoint) : pEntrypoint
        pTarget := pTarget is String ? StrPtr(pTarget) : pTarget

        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pSrcDataMarshal, pSrcData, "ptr", SrcDataSize, "ptr", pFileName, "ptr", pDefines, "ptr", pInclude, "ptr", pEntrypoint, "ptr", pTarget, "uint", Flags1, "uint", Flags2, "ptr*", ppCode, "ptr*", ppErrorMsgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
