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
     * 
     * @param {Pointer<UInt32>} pFirstPos 
     * @param {Pointer<UInt32>} pLength 
     * @param {Pointer<PWSTR>} ppsz 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetData(pFirstPos, pLength, ppsz, pValue) {
        result := ComCall(3, this, "uint*", pFirstPos, "uint*", pLength, "ptr", ppsz, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
