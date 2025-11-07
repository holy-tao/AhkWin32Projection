#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a chunk of data as a string and a PROPVARIANT value.
 * @remarks
 * 
 * In Windows 7, this interface is defined in structuredquerycondition.idl and structuredquerycondition.h. Prior to Windows 7 this interface was declared in structuredquery.h and structuredquery.idl.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nn-structuredquerycondition-irichchunk
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
     * 
     * @param {Pointer<Integer>} pFirstPos 
     * @param {Pointer<Integer>} pLength 
     * @param {Pointer<PWSTR>} ppsz 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-irichchunk-getdata
     */
    GetData(pFirstPos, pLength, ppsz, pValue) {
        pFirstPosMarshal := pFirstPos is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"
        ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pFirstPosMarshal, pFirstPos, pLengthMarshal, pLength, ppszMarshal, ppsz, "ptr", pValue, "HRESULT")
        return result
    }
}
