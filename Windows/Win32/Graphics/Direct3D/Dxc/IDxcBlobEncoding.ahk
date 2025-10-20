#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlob.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcBlobEncoding extends IDxcBlob{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcBlobEncoding
     * @type {Guid}
     */
    static IID => Guid("{7241d424-2646-4191-97c0-98e96e42fc68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEncoding"]

    /**
     * 
     * @param {Pointer<BOOL>} pKnown 
     * @param {Pointer<Integer>} pCodePage 
     * @returns {HRESULT} 
     */
    GetEncoding(pKnown, pCodePage) {
        result := ComCall(5, this, "ptr", pKnown, "uint*", pCodePage, "HRESULT")
        return result
    }
}
