#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a chunk of data as a string and a PROPVARIANT value.
 * @remarks
 * In Windows 7, this interface is defined in structuredquerycondition.idl and structuredquerycondition.h. Prior to Windows 7 this interface was declared in structuredquery.h and structuredquery.idl.
 * @see https://learn.microsoft.com/windows/win32/api//content/structuredquerycondition/nn-structuredquerycondition-irichchunk
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRichChunk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichChunk
     * @type {Guid}
     */
    static IID => Guid("{4fdef69c-dbc9-454e-9910-b34f3c64b510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * Retrieves the PROPVARIANT and input string that represents a chunk of data.
     * @remarks
     * Prior to Windows 7, this was declared in structuredquery.idl and structuredquery.h.
     * @param {Pointer<Integer>} pFirstPos Type: <b>ULONG*</b>
     * 
     * Receives the zero-based starting position of the range. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pLength Type: <b>ULONG*</b>
     * 
     * Receives the length of the range. This parameter can be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppsz Type: <b>LPWSTR*</b>
     * 
     * Receives the associated Unicode string value, or <b>NULL</b> if not available.
     * @param {Pointer<PROPVARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * Receives the associated <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> value, or <b>VT_EMPTY</b> if not available. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/structuredquerycondition/nf-structuredquerycondition-irichchunk-getdata
     */
    GetData(pFirstPos, pLength, ppsz, pValue) {
        pFirstPosMarshal := pFirstPos is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"
        ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pFirstPosMarshal, pFirstPos, pLengthMarshal, pLength, ppszMarshal, ppsz, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
