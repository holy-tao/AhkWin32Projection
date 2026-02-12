#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\ID3DBlob.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 * @version v4.0.30319
 */
class pD3DDisassemble extends IUnknown {

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
     * @param {Pointer} pSrcData 
     * @param {Pointer} SrcDataSize 
     * @param {Integer} Flags 
     * @param {PSTR} szComments 
     * @returns {ID3DBlob} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pSrcData, SrcDataSize, Flags, szComments) {
        szComments := szComments is String ? StrPtr(szComments) : szComments

        result := ComCall(3, this, "ptr", pSrcData, "ptr", SrcDataSize, "uint", Flags, "ptr", szComments, "ptr*", &ppDisassembly := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ID3DBlob(ppDisassembly)
    }
}
