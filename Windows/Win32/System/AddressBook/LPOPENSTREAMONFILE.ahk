#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IStream.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class LPOPENSTREAMONFILE extends IUnknown {

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
     * @param {Pointer<LPALLOCATEBUFFER>} lpAllocateBuffer_ 
     * @param {Pointer<LPFREEBUFFER>} lpFreeBuffer_ 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpszFileName 
     * @param {Pointer<Integer>} lpszPrefix 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpAllocateBuffer_, lpFreeBuffer_, ulFlags, lpszFileName, lpszPrefix) {
        lpszFileNameMarshal := lpszFileName is VarRef ? "char*" : "ptr"
        lpszPrefixMarshal := lpszPrefix is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", lpAllocateBuffer_, "ptr", lpFreeBuffer_, "uint", ulFlags, lpszFileNameMarshal, lpszFileName, lpszPrefixMarshal, lpszPrefix, "ptr*", &lppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(lppStream)
    }
}
